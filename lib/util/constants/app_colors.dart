import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const Color kCyan = Color(0xFF44C2FD);
  static const Color kPurple = Color(0xFF343090);
  static const Color kGreen = Color(0xFF58B368);
  static const Color kPink = Color(0xFFF5487F);
  static const Color kYellow = Color(0xFFFAC736);
  static const Color kLilac = Color(0xFFA29EFF);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kPurpleWhite = Color(0xFFF1F0FE);
  static const Color kTextButtonColor = Color.fromRGBO(0, 0, 0, 0.58);
  static const Color kContinueButton = Color.fromRGBO(0, 0, 0, 0.012);
  static const Color kContinueTextButton = Color.fromRGBO(0, 0, 0, 0.26);
  static const Color kBackgroundFacebookButtonColors =
      Color.fromRGBO(58, 91, 150, 1);

  static const LinearGradient kBlueGradient = LinearGradient(
    colors: <Color>[kCyan, kPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.7],
    transform: GradientRotation((-34 * pi) / 180),
  );

  static const LinearGradient kblueGradientAppBar = LinearGradient(
    colors: <Color>[kCyan, kPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.58],
    transform: GradientRotation((60 * pi) / 180),
  );

  static const LinearGradient kblueGradient2 = LinearGradient(
    colors: <Color>[kCyan, kPurple],
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.58],
    transform: GradientRotation((60 * pi) / 180),
  );

  static const LinearGradient kwhiteGradient = LinearGradient(
    colors: <Color>[kWhite, kPurpleWhite],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 1],
    transform: GradientRotation((0 * pi) / 180),
  );
}
