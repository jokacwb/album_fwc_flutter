// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fwc_album/app/model/groups_stickers_model.dart';
import 'package:fwc_album/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fwc_album/app/repository/stickers/stickers_repository.dart';

import 'my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository stickersRepository;
  late final MyStickersView _view;

  //Variavel para guardar o cache do album
  var album = <GroupsStickersModel>[];
  var statusSelected = 'all';
  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    //este ... Clona o album e envia para o loadPage, para garantir a imutabilidade dentro da presenter
    _view.loadPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      //Mostra todos os grupos
      _view.updateAlbum(album);
    } else {
      //mostra só os grupos selecionados
      final albumFiltered = [
        ...album.where(
          (country) => countries.contains(country.countryCode),
        ),
      ];
      _view.updateAlbum(albumFiltered);
    }
  }
}
