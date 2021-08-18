import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_icons.dart';

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
                          description: list[index].category,
                          date:
                              DateFormat("dd/MM/yyyy").format(list[index].date),
                          value: list[index].value.toStringAsFixed(2).replaceAll(".", ","),
                           color: list[index].category =='Refeição' ?
                                        AppColors.kYellow :
                                        list[index].category == 'Viagem'?
                                        AppColors.kPink :
                                        list[index].category == 'Educação' ?
                                        AppColors.kCyan :
                                        list[index].category == 'Transporte'?
                                        AppColors.kGreen :
                                        list[index].category == 'Pagamentos'?
                                        AppColors.kPurple :
                                        list[index].category == 'Outros'?
                                        AppColors.kLilac :
                                        Color.fromRGBO(52,48,144,1),
                          icon: list[index].category == 'Pix'
                              ? AppIcons.kPix
                              : list[index].category == 'Ted'
                                  ? AppIcons.kTed
                                  : list[index].category == 'Boleto'
                                      ? AppIcons.kBoleto
                                      : list[index].category == 'Dinheiro'
                                          ? AppIcons.kMoney
                                          : list[index].category == 'Doc'
                                              ? AppIcons.kDoc
                                              : list[index].category ==
                                                      'Transporte'
                                                  ? AppIcons.kTransport
                                                  : list[index].category ==
                                                          'Viagem'
                                                      ? AppIcons.kTravel
                                                      : list[index].category ==
                                                              'Educação'
                                                          ? AppIcons.kEducation
                                                          : list[index]
                                                                      .category ==
                                                                  'Refeição'
                                                              ? AppIcons.kMeal
                                                              : list[index]
                                                                          .category ==
                                                                      'Pagamentos'
                                                                  ? AppIcons
                                                                      .kPayments
                                                                  : AppIcons
                                                                      .kOthers,
                        ),
                      )
                    : Center(
                        child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
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
