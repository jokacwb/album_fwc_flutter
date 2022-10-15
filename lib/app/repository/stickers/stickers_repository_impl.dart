import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album/app/core/excpetions/repository_exception.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/model/groups_stickers_model.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;

  StickersRepositoryImpl({required this.dio});

  @override
  Future<List<GroupsStickersModel>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data.map<GroupsStickersModel>((group) => GroupsStickersModel.fromMap(group)).toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar album do usuario', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar albúm do usuário');
    }
  }
}
