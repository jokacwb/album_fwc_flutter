import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/core/ui/global/global_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  // onResponse - depois do retorno da requisição
  // onErro - se ocorrer algum erro na requisição

  // onRequest - antes de executar a requisição
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';

    //Segue com a requisição (Se não acionar o comando a baixo a requisição será descartada)
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      Injector.get<GlobalContext>().loginExpire();
    } else {
      handler.next(err);
    }
    super.onError(err, handler);
  }
}
