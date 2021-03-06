import 'package:mobx/mobx.dart';
part 'login_manager.g.dart';

class LoginManager = _LoginManagerBase with _$LoginManager;

abstract class _LoginManagerBase with Store {

  @observable
  bool passwordVisible=false;

  @action
  Future<void> changePasswordVisible() async {
    passwordVisible = !passwordVisible;
  }
 
}