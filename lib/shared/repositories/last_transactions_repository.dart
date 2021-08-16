import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';

class LastTransactionsRepository {
  Future lastInTransactions({required TransactionInModel transaction}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .orderBy("date")
          .get();
      return response.docs.map((doc) => TransactionInModel(
            description: doc["description"],
            type: doc["type"],
            category: doc["category"],
            date: doc["date"],
            value: doc["value"],
            transactionId: doc["transactionId"],
            userId: doc["userId"],
          ));
      print(response);
    } catch (e) {
      throw e;
    }
  }

  Future lastOutTransactions({required TransactionOutModel transaction}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .orderBy("date")
          .get();
           print(response);
      return response.docs.map((doc) => TransactionOutModel(
            type: doc["type"],
            category: doc["category"],
            date: doc["date"],
            value: doc["value"],
            transactionId: doc["transactionId"],
            userId: doc["userId"],    
          ));
     
    } catch (e) {
      throw e;
    }
  }
}
