import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_out_page_controller.dart';
import 'package:raro_academy_budget/modules/transaction-out-page/widgets/transaction_out_input_widget.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_item_widget.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_widget.dart';
import 'package:raro_academy_budget/shared/widgets/button_widget.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_page_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_icons.dart';

class OutPage extends StatefulWidget {
  static const String id = '/out';

  const OutPage({Key? key}) : super(key: key);

  @override
  _OutPageState createState() => _OutPageState();
}

class _OutPageState extends State<OutPage> {
  DateTime _dateTime = DateTime.now();
  DropDownMenuItem? _value;
  TextEditingController _amountValue = TextEditingController();

  List<DropDownMenuItem> items = [
    const DropDownMenuItem(
      category: 'Refeição',
      icon: AppIcons.kMeal,
      color: AppColors.kYellow,
    ),
    const DropDownMenuItem(
      category: 'Transporte',
      icon: AppIcons.kTransport,
      color: AppColors.kGreen,
    ),
    const DropDownMenuItem(
      category: 'Viagem',
      icon: AppIcons.kTravel,
      color: AppColors.kPink,
    ),
    const DropDownMenuItem(
      category: 'Educação',
      icon: AppIcons.kEducation,
      color: AppColors.kCyan,
    ),
    const DropDownMenuItem(
      category: 'Pagamentos',
      icon: AppIcons.kPayments,
      color: AppColors.kPurple,
    ),
    const DropDownMenuItem(
      category: 'Outros',
      icon: AppIcons.kOthers,
      color: AppColors.kLilac,
    ),
  ];
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _amountValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TransactionPageWidget(
      pageTitle: "Saída",
      button: ButtonWidget(
        buttonIcon: Icons.add,
        buttonText: "Inserir",
        onTap: () {
          TransactionOutController().addTransaction(
            transaction: TransactionOutModel(
              category: _value!.category,
              date: _dateTime,
              type: 'out',
              value: double.parse(_amountValue.text),
            ),
          );
          Navigator.pop(context);
        },
      ),
      children: [
        TransactionOutInputWidget(
          hintText: "Valor em R\$",
          labelText: "Valor em R\$",
          controller: _amountValue,
        ),
        DropdownWidget(
          value: _value,
          labelText: "Tipo de Saída",
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
      ],
    );
  }
}
