import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page/home_page.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class FooterPasswordWidget extends StatefulWidget {
  const FooterPasswordWidget({Key? key}) : super(key: key);

  @override
  _FooterPasswordWidgetState createState() => _FooterPasswordWidgetState();
}

class _FooterPasswordWidgetState extends State<FooterPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                "Recuperar senha".toUpperCase(),
                style: AppTextStyles.kRecoverPassword,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  HomePage.id,
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 36.0,
                width: 114.0,
                decoration: const BoxDecoration(
                  gradient: AppColors.kblueGradientAppBar,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                child: Text(
                  "Continuar".toUpperCase(),
                  style: AppTextStyles.kContinuePassword,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
