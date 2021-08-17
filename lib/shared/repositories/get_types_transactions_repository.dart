import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';


class TypesTransactionsRepository {
  // final typesTransactions = FirebaseDatabase.instance.reference().child('transaction');
  
    Future<TransactionInModel?> getInTransaction({
      required TransactionInModel transaction}) 
    async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: 'in').orderBy("date").snapshots();
      print(response);
    } catch (e) {
      throw e;
    }
  }

  Future<TransactionOutModel?> getOutTransaction(
      {required TransactionOutModel transaction}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: "out").orderBy("date").snapshots();
      print(response);
    } catch (e) {
      throw e;
    }
  }
}
