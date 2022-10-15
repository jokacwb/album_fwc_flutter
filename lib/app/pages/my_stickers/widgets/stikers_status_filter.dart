import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';

class StikersStatusFilter extends StatelessWidget {
  final String filterSeleted;

  const StikersStatusFilter({super.key, required this.filterSeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      //esse wrap serve para quebrar a linha qdo os componentes ultrapassarem a largura do device
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: [
          ButtonCustom(
            width: MediaQuery.of(context).size.width * .3,
            style: context.buttonStyles.yellowButton,
            labelStyle: context.textStyles.textSecondaryFontMedium.copyWith(
              color: context.colors.primary,
            ),
            label: 'Todas',
            onPressed: () {},
          ),
          ButtonCustom(
            width: MediaQuery.of(context).size.width * .3,
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
            onPressed: () {},
          ),
          ButtonCustom(
            width: MediaQuery.of(context).size.width * .3,
            style: context.buttonStyles.primaryButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
