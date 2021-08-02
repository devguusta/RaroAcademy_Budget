import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';
import 'package:raro_academy_budget/modules/splash-page-primary/splash_page_primary.dart';
import 'package:raro_academy_budget/modules/splash-page-secondary/splash_page_seconday.dart';
import 'package:raro_academy_budget/modules/temp-page/home_page.dart';
import 'package:raro_academy_budget/modules/transaction-in-page/transaction_in_page.dart';
import 'package:raro_academy_budget/modules/transaction-out-page/transaction_out_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPageSecondary.id,
      routes: {
        SplashPagePrimary.id: (context) => const SplashPagePrimary(),
        SplashPageSecondary.id: (context) => const SplashPageSecondary(),
        InitialLoginPage.id: (context) => const InitialLoginPage(),
        Home.id: (context) => const Home(),
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
