///Interface responsável por controlar a tela (page) e tb limitar o escopo que a presenter pode chamar
abstract class SplashView {
  ///Logago
  void logged(bool isLogges);

  ///Aciona animação do "carregando/processando"
  void showLoader();
}
