// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../auth/views/login_screen.dart' as _i2;
import '../../home/views/home_page.dart' as _i3;
import '../../splash/views/splash_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginScreen(key: args.key));
    },
    HomeScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i4.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i4.RouteConfig(HomeScreenRoute.name, path: '/home-screen')
      ];
}

/// generated route for [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i2.LoginScreen]
class LoginScreenRoute extends _i4.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({_i5.Key? key})
      : super(name,
            path: '/login-screen', args: LoginScreenRouteArgs(key: key));

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final _i5.Key? key;
}

/// generated route for [_i3.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<void> {
  const HomeScreenRoute() : super(name, path: '/home-screen');

  static const String name = 'HomeScreenRoute';
}
