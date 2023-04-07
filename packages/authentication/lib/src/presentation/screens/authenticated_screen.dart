import 'package:authentication/authentication.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AuthenticatedScreen extends StatelessWidget {
  const AuthenticatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Good job mate. You managed to log in"),
        TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(const AuthUserLoggedOut());
          },
          child: Text("Log out"),
        )
      ],
    ));
  }
}
