import 'package:component_library/component_library.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:routing/routing.dart';

class AuthSplashScreen extends StatelessWidget {
  const AuthSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = PietrockaTheme.of(context);
    return Scaffold(
      appBar: const PietrockaAppBar(),
      body: Padding(
        padding: theme.standardPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(), // 1. Sized Box
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: theme.largetitleTextStyle,
                    children: [
                      TextSpan(
                        text: "Pietrocka ",
                        style: TextStyle(color: theme.primaryColor),
                      ),
                      TextSpan(
                        text: "Home",
                        style: TextStyle(color: theme.companyColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Fa-ti din casa acasa",
                  style: theme.subtitleTextStyle
                      .copyWith(color: theme.secondaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                LongButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const RegistrationRoute());
                    },
                    label: "Inregistreaza-te",
                    isLoading: false),
                SizedBox(height: theme.spacing.small),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const LoginRoute());
                  },
                  child: Text(
                    "Ai deja cont? Logheaza-te",
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
