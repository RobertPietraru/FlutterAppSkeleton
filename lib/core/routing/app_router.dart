import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/presentation/screens/auth_splash_screen.dart';
import '../../features/authentication/presentation/screens/authenticated_screen.dart';
import '../../features/authentication/presentation/screens/login/login_screen.dart';
import '../../features/authentication/presentation/screens/registration/registration_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/auth',
      name: "AuthRouter",
      page: AuthScreen,
      children: [
        AutoRoute(path: '', page: AuthSplashScreen),
        AutoRoute(path: 'login', page: LoginScreen),
        AutoRoute(path: 'signup', page: RegistrationScreen),
      ],
    ),
    AutoRoute(
      initial: true,
      path: '/',
      page: AuthenticatedScreen,
    ),
    AutoRoute(
      page: LoadingScreen,
    ),
  ],
)
class $AppRouter {}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
