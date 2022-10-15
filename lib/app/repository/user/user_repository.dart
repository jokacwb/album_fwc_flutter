import 'package:fwc_album/app/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUsuario();
}
