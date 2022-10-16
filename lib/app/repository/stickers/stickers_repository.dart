import 'package:fwc_album/app/dto/register_sticker_model_dto.dart';
import 'package:fwc_album/app/model/groups_stickers_model.dart';
import 'package:fwc_album/app/model/sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupsStickersModel>> getMyAlbum();
  Future<StickerModel?> findStikerByCodeNumber(String stickerCode, String stickerNumber);
  Future<StickerModel> create(RegisterStickerModelDto registerStickerModel);

  Future<void> registerUserSticker(int stickerId, int amount);
  Future<void> updateUserSticker(int stickerId, int amount);
}
