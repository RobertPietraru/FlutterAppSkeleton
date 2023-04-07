import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/screens/registration/cubit/registration_cubit.dart';
import 'package:component_library/component_library.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:routing/routing.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _EmailRegistrationScreenState();
}

class _EmailRegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegistrationCubit(locator(), authBloc: context.read<AuthBloc>()),
      child: Builder(builder: (context) {
        return BlocConsumer<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state.isSuccessful) {
              AutoRouter.of(context).navigateBack();
            }
          },
          builder: (context, state) {
            return EmailRegistrationScreen(
              onBackButton: () => AutoRouter.of(context).navigateBack(),
            );
          },
        );
      }),
    );
  }
}

class EmailRegistrationScreen extends StatefulWidget {
  final VoidCallback onBackButton;
  const EmailRegistrationScreen({super.key, required this.onBackButton});

  @override
  State<EmailRegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<EmailRegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(
              onPressed: widget.onBackButton,
              icon: const Icon(Icons.arrow_back))),
      body: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state.isSuccessful) {
            Navigator.pop(context);
          }
        },
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
                  children: [
                    TextInputField(
                      hint: 'Name',
                      leading: Icons.person,
                      error: state.nameFailure,
                      controller: nameController,
                      onChanged: (text) => context
                          .read<RegistrationCubit>()
                          .onNameChanged(nameController.text),
                    ),
                    SizedBox(height: theme.spacing.medium),
                    TextInputField(
                        hint: 'Email',
                        error: state.emailFailure,
                        leading: Icons.email,
                        controller: emailController,
                        onChanged: (text) => context
                            .read<RegistrationCubit>()
                            .onEmailChanged(emailController.text)),
                    SizedBox(height: theme.spacing.medium),
                    TextInputField(
                      hint: 'Password',
                      leading: Icons.lock,
                      isPassword: true,
                      error: state.passwordFailure,
                      controller: passwordController,
                      onChanged: (text) => context
                          .read<RegistrationCubit>()
                          .onPasswordChanged(passwordController.text),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LongButton(
                        onPressed: () =>
                            context.read<RegistrationCubit>().register(),
                        label: 'Inregistreaza-te',
                        isLoading: state.status == RegistrationStatus.loading),
                    TextButton(
                        onPressed: () {
                          AutoRouter.of(context).replace(const LoginRoute());
                        },
                        child: Text(
                          "Logheaza-te",
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
