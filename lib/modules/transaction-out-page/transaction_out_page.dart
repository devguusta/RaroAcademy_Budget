import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_item_widget.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_widget.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
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
      pageTitle: "Saída",
      button: ButtonWidget(
        buttonIcon: Icons.add,
        buttonText: "Inserir",
      ),
      children: [
        InputForm(
          hintText: "Valor em R\$",
          labelText: "Valor em R\$",
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
