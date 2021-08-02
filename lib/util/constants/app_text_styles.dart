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

  static const TextStyle kLogoBudget = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 72.0,
    fontStyle: FontStyle.normal,
    letterSpacing: -5,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle kLogoSubtitle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 11.0,
    fontStyle: FontStyle.normal,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle kPoweredBy = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
    fontStyle: FontStyle.italic,
    color: Color.fromRGBO(255, 255, 255, 0.5),
    fontWeight: FontWeight.w300,
  );

  static const TextStyle kNextButtonMedium = TextStyle(
    color: AppColors.kWhite,
    fontSize: 14.0,
    letterSpacing: -0.4,
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

  static const TextStyle kTextButtonGoogle = TextStyle(
    color: AppColors.kTextButtonColor,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );

  static const TextStyle kTextButtonFacebook = TextStyle(
    color: AppColors.kWhite,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );

  static const TextStyle kTextTrasanctionHeader = TextStyle(
    color: AppColors.kWhite,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    fontFamily: "Roboto",
  );
}
