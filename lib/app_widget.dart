import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page-filled/home_page.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';
import 'package:raro_academy_budget/modules/splash-page-primary/splash_page_primary.dart';
import 'package:raro_academy_budget/modules/splash-page-secondary/splash_page_seconday.dart';
import 'modules/signup-page/signup_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      debugShowCheckedModeBanner: false,
      initialRoute: SignUpPage.id,
      routes: {
        SplashPagePrimary.id: (context) => const SplashPagePrimary(),
        SplashPageSecondary.id: (context) => const SplashPageSecondary(),
        InitialLoginPage.id: (context) => const InitialLoginPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        HomePage.id: (context) =>  HomePage(),
        // incluir a rota nomeada como static const
        // Login.id: (context) => HomePage();
        // CreateAccount.id: (context) => HomePage();
        // RecoverPage.id: (context) => RecoverPage();
        // TourPage.id: (context) => TourPage();
      },
    );
  }
}
