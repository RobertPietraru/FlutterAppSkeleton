// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/authentication.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'app_router.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AuthRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    AuthenticatedRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthenticatedScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingScreen(),
      );
    },
    AuthSplashRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthSplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegistrationScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          AuthRouter.name,
          path: '/auth',
          children: [
            _i3.RouteConfig(
              AuthSplashRoute.name,
              path: '',
              parent: AuthRouter.name,
            ),
            _i3.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthRouter.name,
            ),
            _i3.RouteConfig(
              RegistrationRoute.name,
              path: 'signup',
              parent: AuthRouter.name,
            ),
          ],
        ),
        _i3.RouteConfig(
          AuthenticatedRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          LoadingRoute.name,
          path: '/loading-screen',
        ),
      ];
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRouter extends _i3.PageRouteInfo<void> {
  const AuthRouter({List<_i3.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i2.AuthenticatedScreen]
class AuthenticatedRoute extends _i3.PageRouteInfo<void> {
  const AuthenticatedRoute()
      : super(
          AuthenticatedRoute.name,
          path: '/',
        );

  static const String name = 'AuthenticatedRoute';
}

/// generated route for
/// [_i1.LoadingScreen]
class LoadingRoute extends _i3.PageRouteInfo<void> {
  const LoadingRoute()
      : super(
          LoadingRoute.name,
          path: '/loading-screen',
        );

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i2.AuthSplashScreen]
class AuthSplashRoute extends _i3.PageRouteInfo<void> {
  const AuthSplashRoute()
      : super(
          AuthSplashRoute.name,
          path: '',
        );

  static const String name = 'AuthSplashRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationRoute extends _i3.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'signup',
        );

  static const String name = 'RegistrationRoute';
}
