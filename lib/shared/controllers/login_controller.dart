import 'package:raro_academy_budget/shared/repositories/login_repository.dart';
import 'package:raro_academy_budget/shared/models/user_model.dart';

class LoginController {
  LoginRepository repository = LoginRepository();

  Future<UserModel?> login(
      {required String email, required String password}) async {
    UserModel user;
    try {
      user = await repository.login(email: email, password: password);

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> containsEmail({required String email}) async {
    return await repository.containsEmail(email);
  }

  Future<bool> createAccount(
      {required String email,
      required String password,
      required name,
      required phone,
      required cpf}) async {
    try {
      UserModel? userModel = await repository.createAccount(
          email: email, password: password, name: name, phone: phone, cpf: cpf);

      if (userModel != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }
}
