import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpHeader extends StatelessWidget {
  final String text;
  const SignUpHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 74.0),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Image.asset(AppImages.logoBudget),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 48.0, top: 16.0),
                child: Text("Bem-vindo!",
                    style: AppTextStyles.kPrimaryTextLoginPage),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0, right: 57.0),
                child: SizedBox(
                  child: Text(text, style: AppTextStyles.kSubTitleSignUpText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
