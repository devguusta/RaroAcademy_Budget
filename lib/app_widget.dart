import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home/home_page.dart';
import 'package:raro_academy_budget/modules/login/initial_login_page.dart';
import 'package:raro_academy_budget/modules/signup/signup_page.dart';
import 'package:raro_academy_budget/modules/splash/splash_page.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-in-page/transaction_in_page.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-out-page/transaction_out_page.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-update/transaction_update_page.dart';

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
        UpdatePage.id: (context) => const UpdatePage(),
        // HomePage.id: (context) => HomePage(); incluir a rota nomeada como static const
        // Login.id: (context) => HomePage();
        // CreateAccount.id: (context) => HomePage();
        // RecoverPage.id: (context) => RecoverPage();
        // TourPage.id: (context) => TourPage();
      },
    );
  }
}
