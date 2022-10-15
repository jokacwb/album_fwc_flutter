import 'package:fwc_album/app/model/user_model.dart';

///Nesta interface é onde definimos quais funções a view pode interagir com a tela (home_page)
abstract class HomeView {
  void refreshUser(UserModel userModel);
  void error(String message);
  void showLoader();
  void logoutSuccess();
}
