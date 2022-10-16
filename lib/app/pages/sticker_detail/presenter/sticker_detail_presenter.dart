import 'package:fwc_album/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album/app/model/user_sticker_model.dart';
import 'package:fwc_album/app/pages/sticker_detail/view/sticker_detail_view.dart';

abstract class StickerDetailPresenter extends FwcPresenter<StickerDetailView> {
  // Os metodos de uma presenter nunca devem retornar valores, ou seja , deve ser sempre void
  // se tiver algum deles retornando é porque está havendo quebra da arquitetura MVP

  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? userStickerModel,
  });

  void incrementAmount();
  void decrementAmount();
  Future<void> saveSticker();
  Future<void> deleteSticker();
}
