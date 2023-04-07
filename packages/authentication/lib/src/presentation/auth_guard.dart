import 'package:authentication/authentication.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AuthBlocWidget extends StatelessWidget {
  final Widget child;
  const AuthBlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(locator(), locator()),
      child: child,
    );
  }
}
