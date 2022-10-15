import 'package:flutter/widgets.dart';
import 'package:fwc_album/app/core/ui/helpers/loader.dart';
import 'package:fwc_album/app/core/ui/helpers/messages.dart';
import 'package:fwc_album/app/model/groups_stickers_model.dart';
import 'package:fwc_album/app/pages/my_stickers/my_stickers_page.dart';

import 'my_stickers_view.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage> with Messages<MyStickersPage>, Loader<MyStickersPage> implements MyStickersView {
  var album = <GroupsStickersModel>[];
  var statusFilter = 'all';
  var countries = <String, String>{};

  @override
  void initState() {
    //Esse cara atribui valora da instanvia MyStickerView view, que está na instancia de MyStickerPresente que está MyStickerPage (acessada aqui pela referencia "widget")
    widget.presenter.view = this;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      //Chama a presenter da page (widget) para acionar o get do album
      widget.presenter.getMyAlbum();
      hideLoader();
    });
    super.initState();
  }

  @override
  void erro(String message) {
    showError(message);
  }

  @override
  void loadPage(List<GroupsStickersModel> album) {
    setState(() {
      this.album = album;
      countries = {for (var country in album) country.countryCode: country.countryName};
    });
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      statusFilter = status;
    });
  }

  @override
  void updateAlbum(List<GroupsStickersModel> album) {
    hideLoader();
    setState(() {
      this.album = album;
    });
  }
}
