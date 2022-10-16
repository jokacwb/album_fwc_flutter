import 'package:flutter/widgets.dart';
import 'package:fwc_album/app/core/ui/helpers/loader.dart';
import 'package:fwc_album/app/core/ui/helpers/messages.dart';
import 'package:fwc_album/app/pages/sticker_detail/sticker_detail_page.dart';

import './sticker_detail_view.dart';

//Apesar de ser uma implementação ela é marcada como abstrata pois ela vai usar s implementação original do State
abstract class StickerDetailViewImpl extends State<StickerDetailPage> with Loader<StickerDetailPage>, Messages<StickerDetailPage> implements StickerDetailView {
  //Indicador se o caboclo tem a figurinha
  bool hasSticker = false;
  String countryCode = '';
  String stickerNumber = '';
  String countryName = '';
  int amount = 0;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      var arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments != null && arguments is Map<String, dynamic>) {
        widget.presenter.load(
          countryCode: arguments['countryCode'],
          stickerNumber: arguments['stickerNumber'],
          countryName: arguments['countryName'],
          userStickerModel: arguments['userStickerModel'],
        );
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError('Não foi possível carregar a figurinha');
      }
    });
    super.initState();
  }

  @override
  void screenLoaded(bool hasSticker, String countryCode, String stickerNumber, String countryName, int amount) {
    hideLoader();
    setState(() {
      this.hasSticker = hasSticker;
      this.countryCode = countryCode;
      this.stickerNumber = stickerNumber;
      this.countryName = countryName;
      this.amount = amount;
    });
  }

  @override
  void updateAmount(int amount) {
    setState(() {
      this.amount = amount;
    });
  }

  @override
  void saveSuccess() {
    hideLoader();
    Navigator.of(context).pop();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }
}
