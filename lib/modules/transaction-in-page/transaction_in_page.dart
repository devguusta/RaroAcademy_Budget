import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/shared/widgets/insert_button_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class InPage extends StatefulWidget {
  static const String id = '/in';

  const InPage({Key? key}) : super(key: key);

  @override
  _InPageState createState() => _InPageState();
}

class Item {
  final String category;
  final IconData? icon;
  const Item({required this.category, this.icon});
}

class _InPageState extends State<InPage> {
  DateTime _dateTime = DateTime.now();
  Item? _value;

  List<Item> items = [
    const Item(
      category: 'Refeição',
      icon: Icons.restaurant,
    ),
    const Item(
      category: 'Transporte',
      icon: Icons.bus_alert,
    ),
    const Item(
      category: 'Viagem',
      icon: Icons.airplanemode_active,
    ),
    const Item(
      category: 'Educação',
      icon: Icons.school,
    ),
    const Item(
      category: 'Pagamentos',
      icon: Icons.money,
    ),
    const Item(
      category: 'Outros',
      icon: Icons.circle,
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
                                  child: DropdownButton<Item>(
                                    value: _value,
                                    hint: Align(
                                      child: Text("Escolha"),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    isExpanded: true,
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return items.map((Item item) {
                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            item.category,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    items: items.map((Item item) {
                                      return DropdownMenuItem<Item>(
                                        value: item,
                                        child: Row(
                                          children: [
                                            Icon(item.icon),
                                            Text(item.category),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (Item? value) {
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
