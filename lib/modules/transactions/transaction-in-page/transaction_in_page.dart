import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-in-page/widgets/transaction_in_input_widget.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_item_widget.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_widget.dart';
import 'package:raro_academy_budget/shared/widgets/button_widget.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_page_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_icons.dart';

class InPage extends StatefulWidget {
  static const String id = '/in';

  const InPage({Key? key}) : super(key: key);

  @override
  _InPageState createState() => _InPageState();
}

class _InPageState extends State<InPage> {
  DateTime _dateTime = DateTime.now();
  DropDownMenuItem? _value;
  TextEditingController _amountValue = TextEditingController();
  TextEditingController _amountDescription = TextEditingController();

  List<DropDownMenuItem> items = [
    const DropDownMenuItem(
      category: 'Pix',
      icon: AppIcons.kPix,
      color: AppColors.kPurple,
    ),
    const DropDownMenuItem(
      category: 'Dinheiro',
      icon: AppIcons.kMoney,
      color: AppColors.kPurple,
    ),
    const DropDownMenuItem(
      category: 'Doc',
      icon: AppIcons.kDoc,
      color: AppColors.kPurple,
    ),
    const DropDownMenuItem(
      category: 'Ted',
      icon: AppIcons.kTed,
      color: AppColors.kPurple,
    ),
    const DropDownMenuItem(
      category: 'Boleto',
      icon: AppIcons.kBoleto,
      color: AppColors.kPurple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TransactionPageWidget(
      pageTitle: "Entrada",
      button: ButtonWidget(
        buttonIcon: Icons.add,
        buttonText: "Inserir",
        onTap: () {
          TransactionController().addTransaction(
            transaction: TransactionModel(
              value: double.parse(_amountValue.text),
              type: "in",
              category: _value!.category,
              description: _amountDescription.text,
              date: _dateTime,
            ),
          );
          Navigator.pop(context);
        },
      ),
      children: [
        TransactionInInputWidget(
          hintText: "Valor em R\$",
          labelText: "Valor em R\$",
          controller: _amountValue,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormat:
              FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}\.?\d{0,2}')),
        ),
        DropdownWidget(
          value: _value,
          labelText: "Tipo de Entrada",
          selectedItemBuilder: (_) => items.map((DropDownMenuItem item) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.category,
              ),
            );
          }).toList(),
          items: items.map((DropDownMenuItem item) {
            return DropdownMenuItem(
                value: item,
                child: DropDownMenuItem(
                  category: item.category,
                  icon: item.icon,
                  color: item.color,
                ));
          }).toList(),
          onChanged: (DropDownMenuItem? value) {
            setState(() {
              _value = value;
              print(_value!.category);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextButton(
            child: Text(
              DateFormat("dd/MM/yyyy").format(_dateTime),
            ),
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2022))
                  .then((date) {
                setState(() {
                  _dateTime = date!;
                });
              });
            },
          ),
        ),
        TransactionInInputWidget(
          hintText: " ",
          labelText: "Nome da Entrada",
          controller: _amountDescription,
          keyboardType: TextInputType.text,
          inputFormat: FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+|\s')),
        ),
      ],
    );
  }
}
