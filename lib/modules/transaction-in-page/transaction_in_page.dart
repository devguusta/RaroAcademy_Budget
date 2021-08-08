import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_item_widget.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_widget.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return TransactionPageWidget(
      pageTitle: "Entrada",
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
        InputForm(
          hintText: " ",
          labelText: "Nome da Entrada",
        ),
      ],
    );
  }
}
