import 'package:authentication/authentication.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:skeleton/injection.dart';
import 'package:routing/routing.dart';
import 'package:skeleton/l10n/app_localizations.dart';
import 'package:core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();

  runApp(const AuthGuard(child: PietrockaEducation()));
}

class PietrockaEducation extends StatefulWidget {
  const PietrockaEducation({
    Key? key,
  }) : super(key: key);

  @override
  _PietrockaEducationState createState() => _PietrockaEducationState();
}

class _PietrockaEducationState extends State<PietrockaEducation> {
  final _lightTheme = LightPietrockaThemeData();
  final _darkTheme = DarkPietrockaThemeData();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;

    return PietrockaTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate.declarative(
          _appRouter,
          routes: (_) {
            if (state.userEntity == null) {
              return [const AuthSplashRoute()];
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
