import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppWidget());
}
