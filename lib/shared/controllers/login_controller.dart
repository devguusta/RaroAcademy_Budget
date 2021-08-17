import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/shared/repositories/login_repository.dart';
import 'package:raro_academy_budget/shared/models/user_model.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';

class LoginController {
  LoginRepository repository = LoginRepository();

  Future<UserModel?> login(
      {required String email, required String password}) async {
    UserModel user;
    try {
      user = await repository.login(email: email, password: password);
      GetIt.I<UserManager>().setUser(user);
      return user;
    } catch (e) {
      print("Login E: $e");
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
        GetIt.I<UserManager>().setUser(userModel);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Cadastro E: $e");
      throw e;
    }
  }
}
