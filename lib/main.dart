import 'package:conduit_flutter/auth/provider/auth_provider.dart';
import 'package:conduit_flutter/auth/repository/conduit_authenticator.dart';
import 'package:conduit_flutter/auth/repository/credentials_storage/secure_credentials_storage.dart';
import 'package:conduit_flutter/shared/views/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(
    // TODO: Use DI packages to do this.
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthProvider(
            ConduitAuthenticator(
              Dio(),
              SecureCredentialsStorage(const FlutterSecureStorage()),
            ),
          ),
        )
      ],
      child: App(),
    ),
  );
}
