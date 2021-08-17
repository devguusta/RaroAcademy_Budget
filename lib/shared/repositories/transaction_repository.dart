import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';

class TransactionRepository {
  Future<TransactionModel?> addTransaction(
      {required TransactionModel transaction}) async {
    try {
      final transactionRefeference = await FirebaseFirestore.instance
          .collection("transaction")
          .add(transaction.toMap());
      print("document $transactionRefeference added");
    } catch (e) {
      throw e;
    }
  }

  Future<TransactionModel?> updateTransaction(
      {required TransactionModel transaction}) async {
    try {
      final transactionRefeference = FirebaseFirestore.instance
          .collection("transaction")
          .doc(transaction.transactionId)
          .update(transaction.toMap());
      print("Updated $transactionRefeference");
    } catch (e) {
      throw e;
    }
  }

  Future<List?> getOutTransaction() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: 'out')
          .orderBy("date", descending: true)
          .get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<List?> getInTransaction() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: 'in')
          .orderBy("date", descending: true)
          .get();
          return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<List?> getTransaction() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .orderBy("date", descending: true)
          .get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  //  Stream<List<TransactionModel?>> getInTransaction(
  //    {  required TransactionModel? transaction})
  //   async* {
  //   try {
  //     yield* FirebaseFirestore.instance
  //         .collection("transaction")
  //         .where("type", isEqualTo: 'in').orderBy("date",descending: true).snapshots()
  //         .map((e) => e.docs.map((item) => TransactionModel?.fromMap(item.data())).toList());

  //   } catch (e) {
  //     throw e;
  //   }
  // }

}
