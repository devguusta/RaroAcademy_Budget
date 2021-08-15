import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';

class LastTransactionsRepository {
  Future lastTransactions() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .orderBy("date").get();
      print(response);
    } catch (e) {
      throw e;
    }
  }
}
