import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/splash-page-primary/splash_page_primary.dart';
import 'package:raro_academy_budget/modules/splash-page-secondary/splash_page_seconday.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget',
      initialRoute: SplashPage.id,
      routes: {
        SplashPage.id: (context) => SplashPage(),
        SplashPageSec.id: (context) => SplashPageSec(),
        // HomePage.id: (context) => HomePage(); incluir a rota nomeada como static const
        // Login.id: (context) => HomePage();
        // CreateAccount.id: (context) => HomePage();
        // RecoverPage.id: (context) => RecoverPage();
        // TourPage.id: (context) => TourPage();
      },
    );
  }
}
