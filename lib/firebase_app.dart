import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/app_widget.dart';

class FirebaseWidget extends StatefulWidget {
  const FirebaseWidget({Key? key}) : super(key: key);

  @override
  _FirebaseWidgetState createState() => _FirebaseWidgetState();
}

class _FirebaseWidgetState extends State<FirebaseWidget> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Erro ao carregar Firebase!"),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const AppWidget();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
