import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page/home_page.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_page.dart';
import 'package:raro_academy_budget/modules/splash-page/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute:SplashPagePrimary.id,
=======
      initialRoute: SplashPagePrimary.id,
>>>>>>> 555635c3921e05da3437be21fc757524d48fc123
      routes: {
        SplashPagePrimary.id: (context) => const SplashPagePrimary(),
        InitialLoginPage.id: (context) => const InitialLoginPage(),
<<<<<<< HEAD
        SignUpPage.id: (context) => const SignUpPage(),
        HomePage.id: (context) =>  HomePage(),
        // incluir a rota nomeada como static const
=======
        HomePage.id: (context) => const HomePage(),
        SignUpPage.id: (context) => const SignUpPage()
        // incluir a rota nomeada como static const
        // HomePage.id: (context) => HomePage(); incluir a rota nomeada como static const
>>>>>>> 555635c3921e05da3437be21fc757524d48fc123
        // Login.id: (context) => HomePage();
        // CreateAccount.id: (context) => HomePage();
        // RecoverPage.id: (context) => RecoverPage();
        // TourPage.id: (context) => TourPage();
      },
    );
  }
}
