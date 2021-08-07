import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page/home_page.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';
import 'package:raro_academy_budget/modules/splash-page/splash_page.dart';

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
        HomePage.id: (context) => HomePage(),
        // incluir a rota nomeada como static const
        // Login.id: (context) => HomePage();
        // CreateAccount.id: (context) => HomePage();
        // RecoverPage.id: (context) => RecoverPage();
        // TourPage.id: (context) => TourPage();
      },
    );
  }
}
