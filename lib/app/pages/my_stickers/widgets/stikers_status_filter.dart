import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StikersStatusFilter extends StatelessWidget {
  final String filterSeleted;

  const StikersStatusFilter({super.key, required this.filterSeleted});

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();

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
            style: filterSeleted == 'all' ? context.buttonStyles.yellowButton : context.buttonStyles.primaryButton,
            labelStyle: filterSeleted == 'all'
                ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Todas',
            onPressed: () {
              presenter.statusFilter('all');
            },
          ),
          ButtonCustom(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSeleted == 'missing' ? context.buttonStyles.yellowButton : context.buttonStyles.primaryButton,
            labelStyle: filterSeleted == 'missing'
                ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
            onPressed: () {
              presenter.statusFilter('missing');
            },
          ),
          ButtonCustom(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSeleted == 'duplicate' ? context.buttonStyles.yellowButton : context.buttonStyles.primaryButton,
            labelStyle: filterSeleted == 'duplicate'
                ? context.textStyles.textSecondaryFontMedium.copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Repetidas',
            onPressed: () {
              presenter.statusFilter('duplicate');
            },
          ),
        ],
      ),
    );
  }
}
