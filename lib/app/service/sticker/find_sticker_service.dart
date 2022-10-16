import 'package:fwc_album/app/model/sticker_model.dart';

abstract class FindStickerService {
  Future<StickerModel> execute(String stickerCode, String stickerNumber);
}
