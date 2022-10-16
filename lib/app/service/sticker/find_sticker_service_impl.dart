import 'package:fwc_album/app/dto/register_sticker_model_dto.dart';
import 'package:fwc_album/app/model/sticker_model.dart';
import 'package:fwc_album/app/repository/stickers/stickers_repository.dart';

import './find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
  final StickersRepository stickersRepository;

  FindStickerServiceImpl({required this.stickersRepository});

  @override
  Future<StickerModel> execute(String stickerCode, String stickerNumber) async {
    var sticker = await stickersRepository.findStikerByCodeNumber(stickerCode, stickerNumber);

    if (sticker == null) {
      final regSticker = RegisterStickerModelDto(stickerCode: stickerCode, stickerName: '', stickerNumber: stickerNumber);
      sticker = await stickersRepository.create(regSticker);
    }

    return sticker;
  }
}
