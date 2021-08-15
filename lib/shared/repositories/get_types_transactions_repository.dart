import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';


class TypesTransactionsRepository {
  Future<TransactionInModel?> getInTransaction(
      {required TransactionInModel transaction}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: 'in').get();
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
          .where("type", isEqualTo: "out").get();
      print(response);
    } catch (e) {
      throw e;
    }
  }
}
