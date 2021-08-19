import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page/widgets/list_view_last_transactions.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class LastTransactions extends StatelessWidget {
  const LastTransactions({
    Key? key,
  }) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    TransactionController controller = TransactionController();
    double totalValueLastTransactions = 0;
    double totalValueInLastTransactions = 0;
    double totalValueOutLastTransactions = 0;
    var list = [];
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
          stream: controller.getLastTransaction(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else if(snapshot.hasError) {
              return Text("Erro ao buscar os dados no firebase");
            } else if(snapshot.hasData) {
              list = snapshot.data ?? [];
                     totalValueLastTransactions = 0;
                     totalValueInLastTransactions = 0;
                     totalValueOutLastTransactions = 0;
                     list.forEach((transaction) async {
                       if(transaction.type == 'out'){
                         totalValueOutLastTransactions += transaction.value ?? 1;
                       } else if(transaction.type =='in'){
                         totalValueInLastTransactions += transaction.value ?? 1;
                       } else{
                         totalValueInLastTransactions = 0;
                       }               
                       totalValueLastTransactions = totalValueInLastTransactions - totalValueOutLastTransactions;
                     });
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Últimas transações",
                        style: AppTextStyles.kTitleHomeMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(52, 48, 144, 1),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8),
                  child: Text(
                    'R\$ ${totalValueLastTransactions.toStringAsFixed(2).replaceAll(".", ",")}'
                    ,
                    style: AppTextStyles.kSubTitleLastTransactions,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8),
                  child: Text(
                    "No momento",
                    style: AppTextStyles.kMoment,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 24.0),
                  child: ListViewLastTransactions(),
                ),
              ],
            );
            }
            return Container();
            
          }
        ),
      ),
    );
  }
}
