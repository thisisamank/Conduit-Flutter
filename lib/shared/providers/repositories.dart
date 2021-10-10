import 'package:conduit_flutter/auth/provider/auth_provider.dart';
import 'package:conduit_flutter/auth/repository/conduit_authenticator.dart';
import 'package:conduit_flutter/auth/repository/credentials_storage/secure_credentials_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// [repositories.dart] file contains all the dependencies used through out the project.
///  In the main.dart we are simply injecting these to use a single object through out the
/// project.

final flutterStorageProvider =
    RepositoryProvider(create: (context) => const FlutterSecureStorage());

final dioProvider = RepositoryProvider(create: (context) => Dio());

final credentialStorageProvider = RepositoryProvider(
  create: (context) =>
      SecureCredentialsStorage(context.read<FlutterSecureStorage>()),
);

final authenticationApiProvider = RepositoryProvider(
  create: (context) => ConduitAuthenticator(
    context.read<Dio>(),
    context.read<SecureCredentialsStorage>(),
  ),
);

final appAuthProvider = RepositoryProvider(
  create: (context) => AuthProvider(context.read<ConduitAuthenticator>()),
);
