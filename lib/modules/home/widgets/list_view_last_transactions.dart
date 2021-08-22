import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_widget.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class ListViewLastTransactions extends StatefulWidget {
  const ListViewLastTransactions({
    Key? key,
  }) : super(key: key);

  @override
  _ListViewLastTransactionsState createState() =>
      _ListViewLastTransactionsState();
}

class _ListViewLastTransactionsState extends State<ListViewLastTransactions> {
  TransactionController controller = TransactionController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder<List<TransactionModel>>(
            stream: controller.getLastTransaction(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Erro ao buscar os dados");
              } else if (snapshot.hasData) {
                final list = snapshot.data ?? [];
                return list.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: list.length < 3 ? list.length : 3,
                        itemBuilder: (_, index) => TransactionWidget(
                          onTap: () {},
                          type: list[index].type,
                          description: list[index].type == 'in'
                              ? list[index].description!
                              : list[index].category,
                          category: list[index].category,
                          date:
                              DateFormat("dd/MM/yyyy").format(list[index].date),
                          value: list[index].type == 'out'
                              ? '-R\$ ${list[index].value.toStringAsFixed(2).replaceAll(".", ",")}'
                              : 'R\$ ${list[index].value.toStringAsFixed(2).replaceAll(".", ",")}',
                          textStyle: AppTextStyles.kLastTransaction,
                        ),
                      )
                    : Center(
                        child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 24.0, top: 24),
                                child: Text(
                                    'Parece que você não realizou nenhuma transação recentemente!',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 16),
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ));
              }
              return Container();
            }),
      ],
    );
  }
}

//
