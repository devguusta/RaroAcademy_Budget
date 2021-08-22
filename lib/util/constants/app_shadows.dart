import 'package:flutter/material.dart';

class AppShadows {
  static BoxShadow opacity012 = BoxShadow(
    color: Colors.grey.withOpacity(0.12),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 1),
  );
  static BoxShadow opacity014 = BoxShadow(
    color: Colors.grey.withOpacity(0.14),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(0, 4),
  );
  static BoxShadow opacity020 = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: -1,
    blurRadius: 4,
    offset: const Offset(0, 2),
  );
}
