import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home/home_page.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/sucessRegister.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.blue.shade300,
              BlendMode.modulate,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image.asset(
                "assets/images/iconBudgetLarge.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 48.0),
              child: Text(
                "Agora sim!\nVocê terá o\ncontrole\nfinanceiro nas\nsuas mãos!",
                style: AppTextStyles.kOnBoardingText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 24),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: AppColors.kCyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12.5,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    HomePage.id,
                  );
                },
                child: Text("Vamos lá!".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
