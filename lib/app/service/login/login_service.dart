abstract class LoginService {
//design patern command
  Future<void> execute({required String email, required String password});
}
