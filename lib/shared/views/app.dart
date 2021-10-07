import 'package:conduit_flutter/auth/cubits/login/login_cubit.dart';
import 'package:conduit_flutter/auth/provider/auth_provider.dart';
import 'package:conduit_flutter/auth/repository/conduit_authenticator.dart';
import 'package:conduit_flutter/auth/repository/credentials_storage/secure_credentials_storage.dart';
import 'package:conduit_flutter/shared/route/app_router.dart';
import 'package:conduit_flutter/shared/route/app_router.gr.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class App extends StatelessWidget {
  final appRouter = AppRouter();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        AuthProvider(
          ConduitAuthenticator(
            Dio(),
            SecureCredentialsStorage(const FlutterSecureStorage()),
          ),
        ),
      )..getCurrentUser(),
      child: BlocListener<LoginCubit, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            initial: (_) => appRouter.pushAndPopUntil(
              const SplashScreenRoute(),
              predicate: (_) => false,
            ),
            unauthenticated: (_) => appRouter.pushAndPopUntil(
              LoginScreenRoute(),
              predicate: (_) => false,
            ),
            success: (_) => appRouter.pushAndPopUntil(
              const HomeScreenRoute(),
              predicate: (_) => false,
            ),
            orElse: () {},
          );
        },
        child: MaterialApp.router(
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
