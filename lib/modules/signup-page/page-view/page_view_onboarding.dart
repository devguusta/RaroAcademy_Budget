import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/sucessRegister.png",
              fit: BoxFit.fill,
            ),
            // Image.asset(
            //   "assets/images/blue1.png",
            //   fit: BoxFit.fill,
            // ),
            Image.asset(
              "assets/images/blue.png",
              fit: BoxFit.fill,
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [ 
                 
                  Center(child: Image.asset("assets/images/iconBudgetLarge.png")),
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: Text("Agora sim!\nVocê terá o\ncontrole\nfinanceiro nas\suas mãos!", style: AppTextStyles.kOnBoardingText),
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
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        ),
                        onPressed: (){},
                        child: Text("VAMOS LÁ!"),
                      ),
                    ),
                ],
              ),
            ),
          
          ],
        ),
    );
  }
}
