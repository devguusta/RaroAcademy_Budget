import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:raro_academy_budget/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_manager.g.dart';

class UserManager = _UserManagerBase with _$UserManager;

abstract class _UserManagerBase with Store {
  @observable
  UserModel? user;

  @observable
  bool initialAccess = false;

  @observable
  bool? isLoggedIn;

  @action
  void setUser(UserModel? value) => user = value;

  // @computed
  // bool get isLoggedIn => user != null;

  @action
  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('user');

    if (userString != null) {
      setUser(UserModel.fromJson(json.decode(userString)));
      print(user);
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }

    // initialAccess = true;
  }
}
