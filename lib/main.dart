import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:skeleton/injection.dart';

import 'core/components/theme/app_theme.dart';
import 'core/components/theme/app_theme_data.dart';
import 'core/routing/app_router.gr.dart';
import 'features/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'features/authentication/presentation/auth_guard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();

  runApp(const AuthBlocWidget(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _lightTheme = LightAppThemeData();
  final _darkTheme = DarkAppThemeData();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;

    return AppTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate.declarative(
          _appRouter,
          routes: (_) {
            if (state.userEntity == null) {
              return [const AuthRouter()];
            } else {
              return [const AuthenticatedRoute()];
            }
          },
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: _lightTheme.materialThemeData(context),
        darkTheme: _darkTheme.materialThemeData(context),
        // themeMode: darkModePreference?.toThemeMode(),
        themeMode: ThemeMode.light,
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', 'BR'),
          Locale('ro', 'RO'),
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
      ),
    );
  }
}
