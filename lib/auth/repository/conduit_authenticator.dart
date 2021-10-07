import 'dart:io';

import 'package:conduit_flutter/auth/models/failures/auth_failure.dart';
import 'package:conduit_flutter/auth/models/users.dart';
import 'package:conduit_flutter/auth/repository/credentials_storage/credentials_storage.dart';
import 'package:conduit_flutter/shared/models/conduit_error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class ConduitAuthenticator {
  final Dio _dio;
  final CredentialsStorage _storage;

  ConduitAuthenticator(this._dio, this._storage);
  static const String _baseUrl =
      'https://node-express-conduit.appspot.com/api/users';
  static const String _loginPath = '/login';

  Future<User?> getSignedInUser() async {
    try {
      return _storage.read();
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() => getSignedInUser().then((user) => user != null);

  Future<Either<User, AuthFailure>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl$_loginPath',
        data: {
          "user": {
            "email": email,
            "password": password,
          }
        },
      );
      if (response.statusCode == 200) {
        try {
          final user = User.fromRawJson(response.data.toString());
          _storage.save(user);
          return left(user);
        } on FormatException {
          return right(const AuthFailure.network());
        } on PlatformException catch (_) {
          return right(const AuthFailure.storage());
        }
      } else if (response.statusCode == 401) {
        // TODO: Needs cleaning
        final error = ConduitError.fromRawJson(response.data.toString());
        return right(AuthFailure.network(error));
      } else {
        final error = ConduitError.fromRawJson(response.data.toString());
        return right(AuthFailure.network(error));
      }
    } on FormatException {
      return right(const AuthFailure.network());
    } on PlatformException catch (_) {
      return right(const AuthFailure.storage());
    }
  }

  // Future<User> signUp({
  //   required String username,
  //   required String email,
  //   required String password,
  // }) async {

  // }
}
