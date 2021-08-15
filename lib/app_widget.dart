import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page/home_page.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';
import 'package:raro_academy_budget/modules/login-page/password-page/password_page.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_page.dart';
import 'package:raro_academy_budget/modules/splash-page/splash_page.dart';
import 'package:raro_academy_budget/modules/transaction-in-page/transaction_in_page.dart';
import 'package:raro_academy_budget/modules/transaction-out-page/transaction_out_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPagePrimary.id,
      routes: {
        SplashPagePrimary.id: (context) => const SplashPagePrimary(),
        InitialLoginPage.id: (context) => const InitialLoginPage(),
        HomePage.id: (context) => const HomePage(),
        SignUpPage.id: (context) => const SignUpPage(),
        // PasswordPage.id: (context) => const PasswordPage(),
        // incluir a rota nomeada como static const
        InPage.id: (context) => const InPage(),
        OutPage.id: (context) => const OutPage(),
        // HomePage.id: (context) => HomePage(); incluir a rota nomeada como static const
        // Login.id: (context) => HomePage();
        // CreateAccount.id: (context) => HomePage();
        // RecoverPage.id: (context) => RecoverPage();
        // TourPage.id: (context) => TourPage();
      },
    );
  }
}
