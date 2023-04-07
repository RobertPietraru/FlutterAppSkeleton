import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.isLoading,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = PietrockaTheme.of(context);
    return SizedBox(
      width: 100.widthPercent,
      height: 55,
      child: TextButton(
        onPressed: !isLoading ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              CircularProgressIndicator(
                color: theme.defaultBackgroundColor,
              )
            else
              Text(label,
                  style: theme.subtitleTextStyle
                      .copyWith(color: theme.defaultBackgroundColor)),
          ],
        ),
        style: ButtonStyle(
          splashFactory: InkSplash.splashFactory,
          overlayColor:
              MaterialStateColor.resolveWith((states) => theme.secondaryColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
          backgroundColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return theme.primaryColor.withOpacity(0.2);
              }

              return theme.primaryColor;
            },
          ),
        ),
      ),
    );
  }
}
