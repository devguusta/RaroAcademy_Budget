import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_academy_budget/modules/home/home_page.dart';
import 'package:raro_academy_budget/modules/login/initial_login_page.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SplashPagePrimary extends StatefulWidget {
  static const String id = '/splash';

  const SplashPagePrimary({Key? key}) : super(key: key);

  @override
  _SplashPagePrimaryState createState() => _SplashPagePrimaryState();
}

class _SplashPagePrimaryState extends State<SplashPagePrimary> {
  UserManager userManager = GetIt.I<UserManager>();
  ReactionDisposer? disposer;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        userManager.init();
      });
      // Navigator.pushReplacementNamed(context, InitialLoginPage.id));
      disposer = autorun((_) {
        print(userManager.isLoggedIn);
        if (userManager.isLoggedIn!) {
          Navigator.pushReplacementNamed(context, HomePage.id);
        } else {
          Navigator.pushReplacementNamed(context, InitialLoginPage.id);
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.kBlueGradient),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              duration: const Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: (MediaQuery.of(context).size.height / 2) - 110,
                    child: Hero(
                      tag: "budget_logo",
                      child: Image.asset(AppImages.iconBudget),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("budget", style: AppTextStyles.kLogoBudget),
                        const SizedBox(height: 10.0),
                        Text("your wallet's best friend".toUpperCase(),
                            style: AppTextStyles.kLogoSubtitle),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              duration: const Duration(seconds: 1),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("powered by", style: AppTextStyles.kPoweredBy),
                    const SizedBox(height: 10.0),
                    Image.asset(AppImages.logoRaroAcademy),
                    const SizedBox(height: 40.0)
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
