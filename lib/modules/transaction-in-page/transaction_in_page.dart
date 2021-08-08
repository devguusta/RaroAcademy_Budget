import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_item_widget.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_widget.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/shared/widgets/insert_button_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_icons.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

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
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.kblueGradient2,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 28,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Entrada",
                  style: AppTextStyles.kTextTrasanctionHeader,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(gradient: AppColors.kwhiteGradient),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        color: Color(0xFFFDFDFD),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.12),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.14),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: -1,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InputForm(
                            hintText: "Valor em R\$",
                            labelText: "Valor em R\$",
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48.0),
                                  child: DropdownWidget(
                                    value: _value,
                                    labelText: "Tipo de Entrada",
                                    selectedItemBuilder: (_) =>
                                        items.map((DropDownMenuItem item) {
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
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
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
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: MediaQuery.of(context).size.width / 3,
                  child: InsertButton(
                    buttonText: "Inserir",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
