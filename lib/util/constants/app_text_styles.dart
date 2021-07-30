import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle kInputTextMedium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 19.0,
  );
  static const TextStyle kSubtitle3Medium = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
    height: 24.5,
  );

  static const TextStyle kNextButtonMedium = TextStyle(
    color: AppColors.kWhite,
    fontSize: 14.0,
    letterSpacing: 0.4,
  );

  static const TextStyle kPrimaryTextLoginPage = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 48,
    fontFamily: "Roboto",
    color: AppColors.kCyan,
  );

  static const TextStyle kSecondaryTextLoginPage = TextStyle(
    fontSize: 16,
    fontFamily: "Roboto",
    letterSpacing: 0.15,
    color: Color.fromRGBO(0, 0, 0, 0.58),
  );

  static const TextStyle kSecondaryBoldTextLoginPage = TextStyle(
    color: AppColors.kPurple,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.15,
    fontFamily: "Roboto",
  );

  static const TextStyle kContinueTextButton = TextStyle(
    color: AppColors.kContinueTextButton,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );

  static const TextStyle kTextButton = TextStyle(
    color: AppColors.kTextButtonColor,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );
}
