import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';

class ButtonCustom extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outLine;

  const ButtonCustom({
    super.key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height = 40,
    this.onPressed,
    this.outLine = false,
  });

  ButtonCustom.primary({
    super.key,
    required this.label,
    this.width,
    this.height = 40,
    this.onPressed,
  })  : style = ButtonStyles.instance.primaryButton,
        labelStyle = TextStyles.instance.textSecondaryExtraBold,
        outLine = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );
    return SizedBox(
      width: width,
      height: height,
      child: outLine
          ? OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            ),
    );
  }
}
