import 'package:component_library/component_library.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:routing/routing.dart';

class AuthSplashScreen extends StatelessWidget {
  const AuthSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: theme.standardPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(), // 1. Sized Box
            Column(
              children: [
                Text(
                  "My App",
                  style: TextStyle(color: theme.primaryColor),
                ),
              ],
            ),
            Column(
              children: [
                LongButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const RegistrationRoute());
                    },
                    label: "Register",
                    isLoading: false),
                SizedBox(height: theme.spacing.small),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const LoginRoute());
                  },
                  child: Text(
                    "Already have an account? Log in",
                    style: theme.actionTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
