import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';

enum AuthState { empty, loading, authenticated, unauthenticated, error }

class AuthController {
  static AuthController? _instance;
  final navigatorKey = GlobalKey<NavigatorState>();

  AuthController() {
    listen(() {
      if (AuthController.instance.state == AuthState.unauthenticated) {
        print("Unauthenticated");
        navigatorKey.currentState!.pushReplacementNamed(InitialLoginPage.id);
      } else if (AuthController.instance.state == AuthState.authenticated) {
        print("Authenticated");
        // navigatorKey.currentState!.pushReplacementNamed(HomePage.id);
      }
    });
  }

  static AuthController get instance {
    if (_instance == null) {
      _instance = AuthController();
    }
    return _instance!;
  }

  final _stateNotifier = ValueNotifier<AuthState>(AuthState.unauthenticated);
  set _state(AuthState state) => _stateNotifier.value = state;
  AuthState get state => _stateNotifier.value;

  void listen(void Function() listener) {
    _stateNotifier.addListener(listener);
  }

  User? user;

  Future<void> init() async {
    _state = AuthState.loading;
    await Future.delayed(Duration(seconds: 2));
    _state = AuthState.unauthenticated;
    //Verificar no shared preferences se existe um usuário logado
    //IF(true) buscar o dado, e insere no _user
    //IF(false) insere _user como nulo
  }

  Future<void> _setUser(User? user) async {
    this.user = user;
    if (this.user == null) {
      //DELETAR do shared preferences
    } else {
      _state = AuthState.authenticated;
      //SALVAR no shared preferences
    }
  }

  void loginUser(User user) {
    _setUser(user);
  }

  void logoutUser() {
    _setUser(null);
  }
}
