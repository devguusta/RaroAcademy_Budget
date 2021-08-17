import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';


class TypesTransactionsRepository {

    Stream<List<TransactionModel?>> getInTransaction({
      required TransactionModel? transaction}) 
    async* {
    try {
      yield* FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: 'in').orderBy("date",descending: true).snapshots()
          .map((e) => e.docs.map((item) => TransactionModel?.fromMap(item.data())).toList());
      
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
