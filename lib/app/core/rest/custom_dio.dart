import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:fwc_album/app/core/config/env/env.dart';
import 'package:fwc_album/app/core/rest/interceptors/auth_interceptor.dart';

/// estende de DioForNativo para apps mobile, se fosse web teria que usar a DioForWeb
/// Esta classe customiza as chamadas ao backend ja cadastrando os intercptors e configurando os timeout
/// evitando assim que tenhamos que fazer isso em cada chamada
///
class CustomDio extends DioForNative {
  final _authInterceptor = AuthInterceptor();

  CustomDio()
      : super(BaseOptions(
            baseUrl: Env.instance['backend_base_url'] ?? '',
            connectTimeout: 5000, // 5 segundos aguarda para conectar ao backend
            receiveTimeout: 60000 // 1 minuto aguarda para resposta do processamneto do backend
            )) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
