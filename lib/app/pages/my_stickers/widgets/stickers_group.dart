import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/model/groups_stickers_model.dart';
import 'package:fwc_album/app/model/user_sticker_model.dart';
import 'package:fwc_album/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickersGroup extends StatelessWidget {
  final GroupsStickersModel group;
  final String statusfilter;

  const StickersGroup({super.key, required this.group, required this.statusfilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -.1),
                  widthFactor: 1,
                  heightFactor: .1,
                  child: Image.network(
                    group.flag, //  'assets/images/flags/${group.cointryCode}.png',
                    cacheWidth: (MediaQuery.of(context).size.width * 2).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            //Desativando o scroll da grid, pois a rolagem será feita pelo sliver pai
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              //Percorre a lista de figurinhas para ver se o usuário ja tem a figurinha com numero acima stickerNumber
              final stickerList = group.stickers.where(
                (stickerLoop) => stickerLoop.stickerNumber == stickerNumber,
              );
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;
              final stickerWidget = Sticker(
                stickerNumber: stickerNumber,
                userStickerModel: sticker,
                countryCode: group.countryCode,
                countryName: group.countryName,
              );
              if (statusfilter == 'all') {
                return stickerWidget;
              } else if (statusfilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusfilter == 'duplicate') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? userStickerModel;
  final String countryCode;
  final String countryName;

  const Sticker({super.key, required this.stickerNumber, required this.userStickerModel, required this.countryCode, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final presenter = context.get<MyStickersPresenter>();

        await Navigator.of(context).pushNamed('/sticker-detail', arguments: {
          'countryCode': countryCode,
          'stickerNumber': stickerNumber,
          'countryName': countryName,
          'userStickerModel': userStickerModel,
        });

        presenter.refresh();
      },
      child: Container(
        color: userStickerModel != null ? context.colors.primary : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: (userStickerModel != null && ((userStickerModel?.duplicate ?? 0) >= 0)),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  '${userStickerModel?.duplicate}',
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.greyDark,
                  ),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecondaryExtraBold.copyWith(color: userStickerModel != null ? Colors.white : Colors.black),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecondaryExtraBold.copyWith(color: userStickerModel != null ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
