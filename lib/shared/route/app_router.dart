import 'package:auto_route/annotations.dart';
import 'package:conduit_flutter/auth/views/login_screen.dart';
import 'package:conduit_flutter/home/views/home_page.dart';
import 'package:conduit_flutter/splash/views/splash_screen.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen),
  ],
)
class $AppRouter {}
