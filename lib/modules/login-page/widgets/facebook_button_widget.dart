import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class FacebookButtonWidget extends StatelessWidget {
  const FacebookButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        primary: AppColors.kWhite,
        backgroundColor: AppColors.kBackgroundFacebookButtonColors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(AppImages.logoFacebook),
          ),
          const Text(
            "CONTINUAR COM O FACEBOOK",
            style: AppTextStyles.kTextButtonFacebook,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
