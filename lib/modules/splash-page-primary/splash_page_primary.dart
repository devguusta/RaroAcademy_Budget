import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/splash-page-secondary/splash_page_seconday.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  static const String id = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacementNamed(context, SplashPageSec.id),
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
        decoration: BoxDecoration(
          gradient: AppColors.kBlueGradient,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              duration: Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 2) - 110,
                    child: Hero(
                      tag: "budget_logo",
                      child: Image.asset(
                        AppImages.iconBudget,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "budget",
                          style: AppTextStyles.kLogoBudget,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "your wallet's best friend".toUpperCase(),
                          style: AppTextStyles.kLogoSubtitle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              duration: Duration(seconds: 1),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "powered by",
                      style: AppTextStyles.kPoweredBy,
                    ),
                    SizedBox(height: 10.0),
                    Image.asset(AppImages.logoRaroAcademy),
                    SizedBox(height: 40.0)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
