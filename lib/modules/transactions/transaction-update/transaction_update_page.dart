import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/widgets/button_widget.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_page_widget.dart';

class UpdatePage extends StatefulWidget {
  static const String id = '/update';

  const UpdatePage({
    Key? key,
  }) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    final transctioModel =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;

    return TransactionPageWidget(
      pageTitle: "Saída",
      button: ButtonWidget(
        buttonIcon: Icons.autorenew,
        buttonText: 'Atualizar',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      children: [
        Center(
          child: Text(transctioModel.category),
        ),
        Center(
          child: Text(transctioModel.type),
        ),
        Center(
          child: Text(transctioModel.value.toString()),
        ),
      ],
    );
  }
}
