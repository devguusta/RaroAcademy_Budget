import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/app_widget.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initLocator();
  runApp(AppWidget());
}

initLocator() {
  GetIt.I.registerSingleton(UserManager);
}
