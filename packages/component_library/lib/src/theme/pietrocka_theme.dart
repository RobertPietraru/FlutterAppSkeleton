import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class PietrockaTheme extends InheritedWidget {
  const PietrockaTheme({
    required Widget child,
    required this.lightTheme,
    required this.darkTheme,
    Key? key,
  }) : super(
          key: key,
          child: child,
        );

  final PietrockaThemeData lightTheme;
  final PietrockaThemeData darkTheme;

  @override
  bool updateShouldNotify(
    PietrockaTheme oldWidget,
  ) => oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;

  static PietrockaThemeData of(BuildContext context) {
    DeviceSize.init(context);

    final PietrockaTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<PietrockaTheme>();
    assert(inheritedTheme != null, 'No PietrockaTheme found in context');
    final currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? inheritedTheme!.darkTheme
        : inheritedTheme!.lightTheme;
  }
}

