import 'package:mobx/mobx.dart';
import 'package:raro_academy_budget/shared/models/user_model.dart';
part 'user_manager.g.dart';

class UserManager = _UserManagerBase with _$UserManager;

abstract class _UserManagerBase with Store {
  @observable
  UserModel? user;

  @action
  void setUser(UserModel value) => user = value;
}
