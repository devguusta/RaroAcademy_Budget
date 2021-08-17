import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
          .collection("transaction").orderBy("date",descending: true).limit(3).snapshots(),
          builder: (context, AsyncSnapshot streamSnapshot) {
            if(streamSnapshot.connectionState == null) return Container(child: Center(child: CircularProgressIndicator()));     
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: (_, index) => TransactionWidget(
                  description:streamSnapshot.data.docs[index]['category'],
                  date: streamSnapshot.data.docs[index]['date'].toString(), 
                  value: streamSnapshot.data.docs[index]['value'].toString(),
                  icon:  AppIcons.kPix,
                  ),
            );
          }
        ),
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
//                   description: streamSnapshot.data.docs[index]['category'], date: streamSnapshot.data.docs[index]['date'].toString(), value: streamSnapshot.data.docs[index]['value'].toString()),
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
