import 'package:fwc_album/app/model/groups_stickers_model.dart';

abstract class StickersRepository {
  Future<List<GroupsStickersModel>> getMyAlbum();
}
