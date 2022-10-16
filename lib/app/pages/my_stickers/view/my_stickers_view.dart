import 'package:fwc_album/app/model/groups_stickers_model.dart';

abstract class MyStickersView {
  void loadPage(List<GroupsStickersModel> album);
  void erro(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupsStickersModel> album);
  void showLoader();
}
