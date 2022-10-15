import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();
  static ButtonStyles get instance {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.instance.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.instance.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get yellowOutLineButton => OutlinedButton.styleFrom(
        side: BorderSide(color: ColorsApp.instance.yellow),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryOutLineButton => OutlinedButton.styleFrom(
        side: BorderSide(color: ColorsApp.instance.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.instance.textSecondaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );
}

extension ButtonStylesExtensions on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.instance;
}
