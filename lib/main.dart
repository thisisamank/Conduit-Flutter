import 'package:conduit_flutter/shared/providers/repositories.dart';
import 'package:conduit_flutter/shared/views/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      /// All these dependencies are instantiated in the [repository.dart] file and now
      /// we are just injecting it here.
      providers: [
        flutterStorageProvider,
        dioProvider,
        credentialStorageProvider,
        authenticationApiProvider,
        appAuthProvider,
      ],
      child: App(),
    ),
  );
}

// command to generate files:
// flutter pub run build_runner watch --delete-conflicting-outputs