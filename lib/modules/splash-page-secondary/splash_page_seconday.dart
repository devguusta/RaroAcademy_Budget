import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/splash-page-primary/splash_page_primary.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class SplashPageSecondary extends StatefulWidget {
  static const String id = '/splash-sec';

  const SplashPageSecondary({Key? key}) : super(key: key);

  @override
  State<SplashPageSecondary> createState() => _SplashPageSecondaryState();
}

class _SplashPageSecondaryState extends State<SplashPageSecondary> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) => Navigator.pushReplacementNamed(
          context,
          SplashPagePrimary.id,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.kBlueGradient),
      ),
    );
  }
}
