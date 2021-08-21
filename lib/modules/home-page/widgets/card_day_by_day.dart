import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/transactions/transactions-home/in_out_transactions_page.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class CardDaybyDay extends StatefulWidget {
  const CardDaybyDay({Key? key}) : super(key: key);

  @override
  _CardDaybyDayState createState() => _CardDaybyDayState();
}

class _CardDaybyDayState extends State<CardDaybyDay> {
  DateTime selectedDate = DateTime.now();
  String dropdownValue = 'AGO';
  TransactionController controller = TransactionController();

  double totalValueOut = 0;
  double totalValueIn = 0;
  double balanceTransaction = 0.0;
  double balanceTotal = 0;
  var list = [];
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const InOutTransactionsPage(),
            ),
          );
        }, // adicionar a função que abre a tela de entradas/saidas/todos
        child: Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: const [
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
            color: const Color.fromRGBO(253, 253, 253, 1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: StreamBuilder<List<TransactionModel>>(
              stream: controller.getTransaction(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Erro ao buscar os dados");
                } else if (snapshot.hasData) {
                  list = snapshot.data ?? [];
                  balanceTransaction = 0;
                  totalValueOut = 0;
                  totalValueIn = 0;
                  balanceTotal = 0;        
                  list.forEach((transaction)async {
                    if(transaction.type == 'out') {
                       totalValueOut += transaction.value ?? 0;
                    } else if(transaction.type == 'in') {
                       totalValueIn += transaction.value ?? 0;
                    }
                   balanceTotal = transaction.value;
                   balanceTransaction = totalValueIn - totalValueOut;
                 
                  });
                  return Column( 
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
                            const Text(
                              "Dia a dia",
                              style: AppTextStyles.kTitleHomeMedium,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: AppColors.kblueGradientAppBar,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      40.0,
                                    ),
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
                                    icon: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.expand_more_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    iconSize: 18,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'JAN',
                                      'FEV',
                                      'MAR',
                                      'ABR',
                                      'MAI',
                                      'JUN',
                                      'JUL',
                                      'AGO',
                                      'SET',
                                      'OUT',
                                      'NOV',
                                      'DEZ',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            value,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                AppTextStyles.kNextButtonMedium,
                                          ),
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
                        children:[
                          Padding(
                            padding:
                                EdgeInsets.only(left: 16.0, bottom: 16, top: 8),
                            child: Text("R\$ ${balanceTransaction.toStringAsFixed(2).replaceAll(".",",")}",
                                style: AppTextStyles.kSubTitleHomeMedium),
                          ),
                        ],
                      ),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 16.0, bottom: 6, top: 16),
                            child: Text("Saídas",
                                style: AppTextStyles.kTypeTransactions),
                          ),
                          const SizedBox(width: 65),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6, top: 16, right: 16),
                            child: Text("R\$ ${totalValueOut.toStringAsFixed(2).replaceAll(".",",")}",
                                style: AppTextStyles.kValueDayTransactions),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: (totalValueOut != 0 && totalValueIn != 0 ) ?
                          Container(
                            width: totalValueOut > totalValueIn ?
                            size.width : totalValueOut < totalValueIn ?
                            (totalValueOut/totalValueIn) * 100 : size.width*0.45,
                            height: 11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              color: const Color.fromRGBO(68, 194, 253, 1),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 0.39),
                                  blurRadius: 1,
                                  offset: Offset(0, -2),
                                ),
                              ],
                            ),
                          ) : Container(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 16.0, bottom: 6, top: 16),
                            child: Text(
                              "Entradas",
                              style: AppTextStyles.kTypeTransactions,
                            ),
                          ),
                          const SizedBox(width: 65),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 6.0,
                              top: 16.0,
                              right: 18.0,
                            ),
                            child: Text(
                              'R\$ ${ totalValueIn.toStringAsFixed(2).replaceAll(".",",")}',
                              style: AppTextStyles.kValueDayTransactions,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            bottom: 16,
                            right: 16
                          ),
                          child: (totalValueOut != 0 && totalValueIn != 0 ) ?
                          Container(
                            width: totalValueIn > totalValueOut ?
                            size.width : totalValueIn < totalValueOut ?
                            (totalValueIn/totalValueOut) * 100 : size.width * 0.45,
                            height: 11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                              color: const Color.fromRGBO(250, 199, 54, 1),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 0.39),
                                  blurRadius: 1,
                                  offset: Offset(0, -2),
                                ),
                              ],
                            ),
                          ) : Container(),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }
}
