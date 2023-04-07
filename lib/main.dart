import 'package:authentication/authentication.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:skeleton/injection.dart';
import 'package:routing/routing.dart';
import 'package:core/core.dart';

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
          ComponentLibraryLocalizations.delegate,
        ],
      ),
    );
  }
}
