import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const Color kCyan = Color(0xFF44C2FD);
  static const Color kPurple = Color(0xFF343090);
  static const Color kGreen = Color(0xFF58B368);
  static const Color kPink = Color(0xFFF5487F);
  static const Color kYellow = Color(0xFFFAC736);
  static const Color kWhite = Color(0xFFFFFFFF);

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
}