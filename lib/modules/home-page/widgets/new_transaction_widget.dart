import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-in-page/transaction_in_page.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-out-page/transaction_out_page.dart';
import 'package:raro_academy_budget/shared/widgets/button_widget.dart';

class NewTransactionBottomSheet extends StatelessWidget {
  const NewTransactionBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              onTap: () {
                Navigator.pushReplacementNamed(context, OutPage.id);
              },
              buttonText: "Nova Saída",
              buttonIcon: Icons.file_upload,
            ),
            SizedBox(height: 24.0),
            ButtonWidget(
                onTap: () {
                  Navigator.pushReplacementNamed(context, InPage.id);
                },
                buttonIcon: Icons.file_download,
                buttonText: "Nova Entrada"),
          ],
        ),
      ),
    );
  }
}
