import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_widget.dart';
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
                          value: list[index].value.toString(),
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
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                  'Parece que você ainda não realizou nenhuma transação!',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 16),
                                  textAlign: TextAlign.center),
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

// StreamBuilder<Object>(
//           stream: FirebaseFirestore.instance
//           .collection("transaction").orderBy("date").snapshots(),
//           builder: (context, AsyncSnapshot streamSnapshot) {
           
//             if(streamSnapshot.connectionState == null) return Container(child: CircularProgressIndicator());
            
//             return ListView.builder(
//               shrinkWrap: true,
//               primary: false,
//               itemCount: 3,
//               itemBuilder: (_, index) => TransactionWidget(
//                   description: list[index]['category'], date: streamSnapshot.data.docs[index]['date'].toString(), value: streamSnapshot.data.docs[index]['value'].toString()),
//             );
//           }
//         ),


// Future lastInTransactions({required TransactionModel transaction}) async {
//     try {
//       final response = await FirebaseFirestore.instance
//           .collection("transaction")
//           .orderBy("date")
//           .get();
//       return response.docs.map((doc) => TransactionModel(
//             description: doc["description"],
//             type: doc["type"],
//             category: doc["category"],
//             date: doc["date"],
//             value: doc["value"],
//             transactionId: doc["transactionId"],
//             userId: doc["userId"],
//           ));
        
//       print(response);
//     } catch (e) {
//       throw e;
//     }
//   }
