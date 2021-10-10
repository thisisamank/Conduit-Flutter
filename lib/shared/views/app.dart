import 'package:conduit_flutter/auth/cubits/authentication_cubit.dart';
import 'package:conduit_flutter/auth/provider/auth_provider.dart';
import 'package:conduit_flutter/shared/route/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final appRouter = AppRouter();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AuthenticationCubit(context.read<AuthProvider>())
                  ..getCurrentUser()),
      ],
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
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
            authenticated: (_) => appRouter.pushAndPopUntil(
              const HomeScreenRoute(),
              predicate: (_) => false,
            ),
            orElse: () {},
          );
        },
        child: MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'BrandFont',
          ),
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
