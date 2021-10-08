import 'package:conduit_flutter/auth/models/failures/auth_failure.dart';
import 'package:conduit_flutter/auth/models/users.dart';
import 'package:conduit_flutter/auth/repository/conduit_authenticator.dart';
import 'package:dartz/dartz.dart';

class AuthProvider {
  final ConduitAuthenticator _authenticator;
  AuthProvider(this._authenticator);
  Future<bool> isUserSignedIn() {
    return _authenticator.isSignedIn();
  }

  Future<User?> getCurrentUser() {
    return _authenticator.getSignedInUser();
  }

  Future<Either<User, AuthFailure>> login({
    required String email,
    required String password,
  }) {
    return _authenticator.login(email: email, password: password);
  }
}
