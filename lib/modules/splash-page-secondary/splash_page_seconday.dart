import 'package:flutter/material.dart';

class SplashPageSec extends StatelessWidget {
  static const String id = '/splash-sec';

  const SplashPageSec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Definir roda da página'),
      ),
    );
  }
}
