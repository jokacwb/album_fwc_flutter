import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/core/ui/widgets/rounded_button.dart';
import 'package:fwc_album/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';
import 'package:fwc_album/app/pages/sticker_detail/view/sticker_detail_view_impl.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;
  const StickerDetailPage({super.key, required this.presenter});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe da figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hasSticker ? Image.asset('assets/images/sticker.png') : Image.asset('assets/images/sticker_pb.png'),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '$countryCode $stickerNumber',
                        style: context.textStyles.textPrimaryFontBold.copyWith(fontSize: 22),
                      ),
                    ),
                    const Spacer(),
                    RoundedButton(
                      icon: Icons.remove,
                      onPressed: widget.presenter.decrementAmount,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '$amount',
                        style: context.textStyles.textSecondaryFontMedium,
                      ),
                    ),
                    RoundedButton(
                      icon: Icons.add,
                      onPressed: widget.presenter.incrementAmount,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(countryName, style: context.textStyles.textPrimaryFontRegular),
              ),
              ButtonCustom.primary(
                width: MediaQuery.of(context).size.width * .9,
                label: hasSticker ? 'Atualizar Figurinha' : 'Adicionar Figurinha',
                onPressed: widget.presenter.saveSticker,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonCustom(
                width: MediaQuery.of(context).size.width * .9,
                outLine: true,
                label: 'Excluir Figurinha',
                onPressed: widget.presenter.deleteSticker,
                style: context.buttonStyles.primaryOutLineButton,
                labelStyle: context.textStyles.textSecondaryExtraBoldPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
