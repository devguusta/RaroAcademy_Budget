import 'package:flutter/material.dart';

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
    color: Colors.white,
    fontSize: 14.0,
    letterSpacing: -0.4,
  );
}
