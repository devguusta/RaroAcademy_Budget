import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/in-out-transactions-page/in_out_transactions_page.dart';

import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class CardDaybyDay extends StatefulWidget {
  CardDaybyDay({
    Key? key,
  }) : super(key: key);

  @override
  _CardDaybyDayState createState() => _CardDaybyDayState();
}

class _CardDaybyDayState extends State<CardDaybyDay> {
  DateTime selectedDate = DateTime.now();
  String dropdownValue = 'Agosto';
  String out = 'R\$ 5.000,00';
  String entradas = 'R\$ 8.0000';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => InOutTransactionsPage()));
        }, // adicionar a função que abre a tela de entradas/saidas/todos
        child: Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                // spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.14),
                offset: Offset(0, 3),
                blurRadius: 1,
              ),
            ],
            color: Color.fromRGBO(253, 253, 253, 1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dia a dia", style: AppTextStyles.kTitleHomeMedium),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.kblueGradientAppBar,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: DropdownButton<String>(
                            menuMaxHeight: size.height * 0.3,
                            elevation: 8,
                            dropdownColor: AppColors.kPurple,
                            value: dropdownValue,
                            underline: Container(
                              height: 0,
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.expand_more_outlined,
                                  color: Colors.white),
                            ),
                            iconSize: 18,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Janeiro',
                              'Fevereiro',
                              'Março',
                              'Abril',
                              'Maio',
                              'Junho',
                              'Julho',
                              'Agosto',
                              'Setembro',
                              'Outubro',
                              'Novembro',
                              'Dezembro',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.kNextButtonMedium,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 16, top: 8),
                    child: Text("R\$ 3.000,00",
                        style: AppTextStyles.kSubTitleHomeMedium),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 6, top: 16),
                    child:
                        Text("Saídas", style: AppTextStyles.kTypeTransactions),
                  ),
                  SizedBox(width: 65),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, top: 16),
                    child:
                        Text(out, style: AppTextStyles.kValueDayTransactions),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    width: size.width * 0.5,
                    height: 11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color: Color.fromRGBO(68, 194, 253, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.39),
                          blurRadius: 1,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 6, top: 16),
                    child: Text("Entradas",
                        style: AppTextStyles.kTypeTransactions),
                  ),
                  SizedBox(width: 65),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 6, top: 16, right: 6),
                    child: Text(entradas,
                        style: AppTextStyles.kValueDayTransactions),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    bottom: 16,
                  ),
                  child: Container(
                    width: size.width * 0.8,
                    height: 11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color: Color.fromRGBO(250, 199, 54, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.39),
                          blurRadius: 1,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
