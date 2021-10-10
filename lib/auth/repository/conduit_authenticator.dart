import 'dart:io';

import 'package:conduit_flutter/auth/models/failures/auth_failure.dart';
import 'package:conduit_flutter/auth/models/users.dart';
import 'package:conduit_flutter/auth/repository/credentials_storage/credentials_storage.dart';
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

  Future<bool> isSignedIn() async => getSignedInUser().then((user) {
        return user != null;
      });

// TODO: better error handling required here.

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
          final user = User.fromJson(response.data as Map<String, dynamic>);
          _storage.save(user);
          return left(user);
        } on FormatException {
          return right(const AuthFailure.network());
        } on PlatformException catch (_) {
          return right(const AuthFailure.storage());
        }
      } else {
        return right(const AuthFailure.network("Internal error."));
      }
    } on DioError catch (error) {
      if (error.response == null) {
        return right(
            const AuthFailure.network("Oops! check your internet connection."));
      } else if (error.response!.statusCode == 422) {
        return right(const AuthFailure.network("Invalid email or password!"));
      } else {
        return right(const AuthFailure.network("Oops! something went wrong."));
      }
    }
  }

  Future<Either<User, AuthFailure>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        _baseUrl,
        data: {
          "user": {
            "username": username,
            "email": email,
            "password": password,
          }
        },
      );
      if (response.statusCode == 200) {
        try {
          final user = User.fromJson(response.data as Map<String, dynamic>);
          _storage.save(user);
          return left(user);
        } on FormatException {
          return right(const AuthFailure.network());
        } on PlatformException catch (_) {
          return right(const AuthFailure.storage());
        }
      } else {
        return right(const AuthFailure.network("Internal error."));
      }
    } on DioError catch (error) {
      if (error.response == null) {
        return right(
            const AuthFailure.network("Oops! check your internet connection."));
      } else if (error.response!.statusCode == 422) {
        return right(
            const AuthFailure.network("email or password already taken."));
      } else {
        return right(const AuthFailure.network("Oops! something went wrong."));
      }
    }
  }
}
