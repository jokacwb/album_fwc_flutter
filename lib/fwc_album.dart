import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/core/theme/theme_config.dart';
import 'package:fwc_album/app/core/ui/global/global_context.dart';
import 'package:fwc_album/app/core/ui/global/global_context_impl.dart';
import 'package:fwc_album/app/pages/auth/login/login_route.dart';
import 'package:fwc_album/app/pages/auth/register/register_route.dart';
import 'package:fwc_album/app/pages/home/home_route.dart';
import 'package:fwc_album/app/pages/my_stickers/my_stickers_route.dart';
import 'package:fwc_album/app/pages/splash/splash_route.dart';
import 'package:fwc_album/app/repository/auth/auth_repository.dart';
import 'package:fwc_album/app/repository/auth/auth_repository_impl.dart';

class FwcAlbum extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()), //Deixando o CutomDio disponivel para o app todo
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())), //Deixando o repository de autenticação disponivel para o app todo
        Bind.lazySingleton<GlobalContext>((i) => GlobalContextImpl(navigatorKey: navigatorKey, authRepository: i())),
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album',
        theme: ThemeConfig.theme,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => const HomeRoute(),
          '/mystickers': (_) => const MyStickersRoute(),
        },
      ),
    );
  }
}
