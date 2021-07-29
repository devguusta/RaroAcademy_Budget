import 'package:flutter/material.dart';

class SplashPageSecondary extends StatelessWidget {
  static const String id = '/splash-sec';

  const SplashPageSecondary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Definir roda da página')),
    );
  }
}
