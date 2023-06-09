import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/app_app_bar.dart';
import '../../../../../core/components/buttons/long_button.dart';
import '../../../../../core/components/text_input_field.dart';
import '../../../../../core/components/theme/app_theme.dart';
import '../../../../../core/routing/app_router.gr.dart';
import '../../../../../injection.dart';
import '../../auth_bloc/auth_bloc.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        child: const _LoginScreen(),
        create: (_) =>
            LoginCubit(locator(), authBloc: context.read<AuthBloc>()));
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: theme.spacing.small,
                vertical: theme.spacing.xLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("My app", style: theme.titleTextStyle),
                    Text(
                      "We do something",
                      style: theme.subtitleTextStyle
                          .copyWith(color: theme.secondaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextInputField(
                      leading: Icons.email,
                      controller: emailController,
                      hint: 'Email',
                      onChanged: (text) => context
                          .read<LoginCubit>()
                          .onEmailChanged(emailController.text),
                      error: state.emailFailure,
                    ),
                    SizedBox(height: theme.spacing.medium),
                    TextInputField(
                      hint: 'Password',
                      error: state.passwordFailure,
                      leading: Icons.lock,
                      isPassword: true,
                      controller: passwordController,
                      onChanged: (text) => context
                          .read<LoginCubit>()
                          .onPasswordChanged(passwordController.text),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LongButton(
                        onPressed: () => context.read<LoginCubit>().login(),
                        label: 'Log in',
                        isLoading: state.isLoading),
                    TextButton(
                        onPressed: () {
                          AutoRouter.of(context) .replace(const RegistrationRoute());
                        },
                        child: Text(
                          "Don't have an account? Register",
                          style: theme.actionTextStyle,
                        ))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
