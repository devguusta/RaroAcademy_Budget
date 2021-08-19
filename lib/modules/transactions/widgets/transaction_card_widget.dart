import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-in-page/transaction_in_page.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-out-page/transaction_out_page.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-update/transaction_update_page.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class TransactionsCardWidget extends StatefulWidget {
  TransactionsCardWidget({Key? key, required this.context, required this.type})
      : super(key: key);
  final BuildContext context;
  final int type;

  @override
  _TransactionsCardWidgetState createState() => _TransactionsCardWidgetState();
}

class _TransactionsCardWidgetState extends State<TransactionsCardWidget> {
  TransactionController controller = TransactionController();

  double totalValueOut = 0;
  double totalValueIn = 0;
  double balanceTransaction = 0.0;
  double totalValue = 0;
  var list = [];
  bool wait = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 40),
        height: double.maxFinite,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
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
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                child: StreamBuilder<List<TransactionModel>>(
                    stream: widget.type == 0
                        ? controller.getInTransaction()
                        : widget.type == 1
                            ? controller.getOutTransaction()
                            : controller.getTransaction(),
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
                        totalValue = 0;
                        list.forEach((transaction) async {
                          if (transaction.type == 'out') {
                            totalValueOut += transaction.value ?? 0;
                          } else if (transaction.type == 'in') {
                            totalValueIn += transaction.value ?? 0;
                          }
                          balanceTransaction = totalValueIn - totalValueOut;
                          totalValue += transaction.value;
                        });
                        return list.length > 0
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: list.length,
                                      itemBuilder: (_, index) =>
                                          TransactionWidget(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, UpdatePage.id);
                                        },
                                        type: list[index].type,
                                        category: list[index].category,
                                        description: list[index].type == 'in'
                                            ? list[index].description
                                            : list[index].category,
                                        date: DateFormat("dd/MM/yyyy")
                                            .format(list[index].date),
                                        value:
                                            (('R\$ ${list[index].value.toStringAsFixed(2).replaceAll(".", ",")}')),
                                        textStyle:
                                            AppTextStyles.kTextTransactions,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.type == 0
                                              ? "Total entradas"
                                              : widget.type == 1
                                                  ? "Total saídas"
                                                  : "Total",
                                          style: AppTextStyles.kInputTextMedium
                                              .copyWith(
                                                  color: Color.fromRGBO(
                                                      52, 48, 144, 1)),
                                        ),
                                        Text(
                                          widget.type == 2
                                              ? "R\$ ${balanceTransaction.toStringAsFixed(2).replaceAll(".", ",")}"
                                              : "R\$ ${totalValue.toStringAsFixed(2).replaceAll(".", ",")}",
                                          style: AppTextStyles.kSubtitle3Medium
                                              .copyWith(
                                            color: widget.type == 0
                                                ? Color.fromRGBO(
                                                    88, 179, 104, 1)
                                                : widget.type == 1
                                                    ? Color.fromRGBO(
                                                        244, 67, 54, 1)
                                                    : totalValueIn >
                                                            totalValueOut
                                                        ? Color.fromRGBO(
                                                            88, 179, 104, 1)
                                                        : Color.fromRGBO(
                                                            244, 67, 54, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                            'Parece não possui nenhuma transação nesse mês!',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 16),
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      }
                      return Container();
                    }),
              ),
            ),
            ],
          ),
        ),
        Visibility(
          visible: widget.type == 2 ? false : true,
          child: Positioned(
              bottom: 18,
              left: (MediaQuery.of(context).size.width - 32) / 2,
              child: InkWell(
                onTap: () {
                  if (widget.type == 0) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => InPage()));
                  } else if (widget.type == 1) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => OutPage()));
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      gradient: AppColors.kBlueGradient,
                      shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
