import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album/app/core/excpetions/repository_exception.dart';
import 'package:fwc_album/app/core/excpetions/unauthorized_excpetion.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/model/register_user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login({required String email, required String password}) async {
    try {
      final result = await dio.post(
        '/api/auth',
        data: {
          'email': email,
          'password': password,
        },
      );

      final acccessToken = result.data['access_token'];
      if (acccessToken == null) {
        throw UnauthorizedExcpetion();
      }
      return acccessToken;
    } on DioError catch (e, s) {
      log('Erro ao efeutar login', error: e, stackTrace: s);
      if (e.response?.statusCode == 401) {
        throw UnauthorizedExcpetion();
      }
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post('/api/register', data: registerModel.toMap());
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar usuario: ${e.message}');
    }
  }
}
