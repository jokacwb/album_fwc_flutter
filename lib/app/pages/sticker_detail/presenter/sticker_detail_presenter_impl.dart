import 'package:fwc_album/app/model/sticker_model.dart';
import 'package:fwc_album/app/model/user_sticker_model.dart';
import 'package:fwc_album/app/pages/sticker_detail/view/sticker_detail_view.dart';
import 'package:fwc_album/app/repository/stickers/stickers_repository.dart';
import 'package:fwc_album/app/service/sticker/find_sticker_service.dart';

import './sticker_detail_presenter.dart';

class StickerDetailPresenterImpl implements StickerDetailPresenter {
  late final StickerDetailView _view;
  final FindStickerService findStickerService;
  final StickersRepository stickersRepository;

  StickerModel? stickerModel;
  UserStickerModel? userStickerModel;
  int amount = 0;

  StickerDetailPresenterImpl({required this.stickersRepository, required this.findStickerService});

  @override
  set view(StickerDetailView view) => _view = view;

  ///Carrega detalhe da figurinha, ou seja , carrega a figurinha propriamente dita
  @override
  Future<void> load({required String countryCode, required String stickerNumber, required String countryName, UserStickerModel? userStickerModel}) async {
    this.userStickerModel = userStickerModel;
    //Verifica se o caboclo tem a figurinha
    //Se ele não tiver buscamos o modelo da figurinha no backend
    if (userStickerModel == null) {
      stickerModel = await findStickerService.execute(countryCode, stickerNumber);
    }

    bool hasSticker = userStickerModel != null;

    if (hasSticker) {
      amount = userStickerModel.duplicate + 1;
    }
    _view.screenLoaded(hasSticker, countryCode, stickerNumber, countryName, amount);
  }

  @override
  void decrementAmount() {
    if (amount > 1) {
      _view.updateAmount(--amount);
    }
  }

  @override
  void incrementAmount() {
    _view.updateAmount(++amount);
  }

  @override
  Future<void> saveSticker() async {
    try {
      _view.showLoader();
      //Se o usuario não tiver a figurinha pega o id da figurinha da propria model de figurinha
      if (userStickerModel == null) {
        await stickersRepository.registerUserSticker(stickerModel!.id, amount);
      } else {
        //Já se ele possui a figurinha pega da associação figura X usuario
        await stickersRepository.updateUserSticker(userStickerModel!.id, amount);
      }
      _view.saveSuccess();
    } catch (e) {
      _view.error('Erro ao tentar salvar figurinha!');
    }
  }

  @override
  Future<void> deleteSticker() async {
    try {
      _view.showLoader();
      if (userStickerModel != null) {
        await stickersRepository.updateUserSticker(userStickerModel!.id, 0);
      }
      _view.saveSuccess();
    } catch (e) {
      _view.error('Erro ao tentar deletar figurinha!');
    }
  }
}
