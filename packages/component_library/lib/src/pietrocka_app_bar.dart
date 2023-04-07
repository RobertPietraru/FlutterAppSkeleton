import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component_library.dart';

class PietrockaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLeading;
  final Widget? leading;
  final List<Widget>? trailing;
  final Widget? title;
  final PreferredSizeWidget? bottom;
  const PietrockaAppBar({
    Key? key,
    this.showLeading = true,
    this.leading,
    this.trailing,
    this.title,
    this.bottom,
  }) : super(key: key);

  AppBar pietrockaAppBar({
    required PietrockaThemeData theme,
  }) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      automaticallyImplyLeading: showLeading && leading == null,
      leading: leading,
      centerTitle: true,
      title: title ??
          PietrockaLogo(
            color: theme.primaryColor,
          ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: trailing,
      bottom: bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = PietrockaTheme.of(context);
    return pietrockaAppBar(theme: theme);
  }

  @override
  Size get preferredSize =>
      pietrockaAppBar(theme: LightPietrockaThemeData()).preferredSize;
}
