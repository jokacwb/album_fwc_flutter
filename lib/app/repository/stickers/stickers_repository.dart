import 'package:fwc_album/app/model/groups_stickers.dart';

abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
}
