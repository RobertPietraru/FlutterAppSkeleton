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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../features/authentication/presentation/screens/auth_splash_screen.dart'
    as _i3;
import '../../features/authentication/presentation/screens/authenticated_screen.dart'
    as _i2;
import '../../features/authentication/presentation/screens/login/login_screen.dart'
    as _i4;
import '../../features/authentication/presentation/screens/registration/registration_screen.dart'
    as _i5;
import 'app_router.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    AuthenticatedRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthenticatedScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingScreen(),
      );
    },
    AuthSplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthSplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegistrationScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          AuthRouter.name,
          path: '/auth',
          children: [
            _i6.RouteConfig(
              AuthSplashRoute.name,
              path: '',
              parent: AuthRouter.name,
            ),
            _i6.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthRouter.name,
            ),
            _i6.RouteConfig(
              RegistrationRoute.name,
              path: 'signup',
              parent: AuthRouter.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          AuthenticatedRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LoadingRoute.name,
          path: '/loading-screen',
        ),
      ];
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRouter extends _i6.PageRouteInfo<void> {
  const AuthRouter({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i2.AuthenticatedScreen]
class AuthenticatedRoute extends _i6.PageRouteInfo<void> {
  const AuthenticatedRoute()
      : super(
          AuthenticatedRoute.name,
          path: '/',
        );

  static const String name = 'AuthenticatedRoute';
}

/// generated route for
/// [_i1.LoadingScreen]
class LoadingRoute extends _i6.PageRouteInfo<void> {
  const LoadingRoute()
      : super(
          LoadingRoute.name,
          path: '/loading-screen',
        );

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i3.AuthSplashScreen]
class AuthSplashRoute extends _i6.PageRouteInfo<void> {
  const AuthSplashRoute()
      : super(
          AuthSplashRoute.name,
          path: '',
        );

  static const String name = 'AuthSplashRoute';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.RegistrationScreen]
class RegistrationRoute extends _i6.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'signup',
        );

  static const String name = 'RegistrationRoute';
}
