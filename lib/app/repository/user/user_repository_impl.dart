// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album/app/core/excpetions/repository_exception.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/model/user_model.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;

  UserRepositoryImpl({
    required this.dio,
  });

  @override
  Future<UserModel> getUsuario() async {
    try {
      final result = await dio.auth().get('/api/me');
      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar usuário logado', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar dados do usuário');
    }
  }
}
