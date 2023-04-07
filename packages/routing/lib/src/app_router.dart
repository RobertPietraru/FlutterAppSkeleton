import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

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
