import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/transaction-in-page/transaction_in_page.dart';
import 'package:raro_academy_budget/modules/transaction-out-page/transaction_out_page.dart';

class Home extends StatelessWidget {
  static const String id = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, InPage.id);
              },
              child: Text('InPage'),
            ),
            SizedBox(width: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, OutPage.id);
              },
              child: Text('OutPage'),
            ),
          ],
        ),
      ),
    );
  }
}
