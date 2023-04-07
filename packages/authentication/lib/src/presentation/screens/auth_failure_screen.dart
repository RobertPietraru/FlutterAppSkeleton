import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';

class AuthFailureScreen extends StatelessWidget {
  final AuthFailureState state;
  const AuthFailureScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        Text(
          "¯\\_(ツ)_/¯",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text("Sorry mate, something went wrong"),
      ]),
    );
  }
}
