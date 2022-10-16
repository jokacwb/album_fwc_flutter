import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album/app/core/excpetions/repository_exception.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/dto/register_sticker_model_dto.dart';
import 'package:fwc_album/app/model/groups_stickers_model.dart';
import 'package:fwc_album/app/model/sticker_model.dart';

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

  @override
  Future<StickerModel?> findStikerByCodeNumber(String stickerCode, String stickerNumber) async {
    try {
      final result = await dio.auth().get(
        '/api/sticker-search',
        queryParameters: {
          'sticker_code': stickerCode,
          'sticker_number': stickerNumber,
        },
      );

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      log('Erro  ao buscar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Falha ao buscar figurinha por codigo!');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModelDto registerStickerModelDto) async {
    try {
      final body = FormData.fromMap({...registerStickerModelDto.toMap()});
      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao cadastrar figurinha ${e.message}', error: e, stackTrace: s);
      throw RepositoryException(message: 'Falha ao cadatrar figurinha!');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {'id_sticker': stickerId, 'amount': amount});
    } on DioError catch (e, s) {
      log('Erro ao tentar incluir figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao tentar incluir figurinha: ${e.message}');
    }
  }

  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {'id_sticker': stickerId, 'amount': amount});
    } on DioError catch (e, s) {
      log('Erro ao tentar incluir figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao tentar incluir figurinha: ${e.message}');
    }
  }
}
