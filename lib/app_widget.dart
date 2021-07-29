import 'package:flutter/material.dart';
import 'package:raro_academy_budget/features/login/initial_login_page.dart';

import 'package:raro_academy_budget/util/constants/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Budget',
      debugShowCheckedModeBanner: false,
      home: InitialLoginPage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: AppColors.kWhite,
//       body: Center(),
//     );
//   }
// }
