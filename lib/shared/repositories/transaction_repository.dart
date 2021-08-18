import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';

class TransactionRepository {
  final UserManager userManager = GetIt.I<UserManager>();

  Future<TransactionModel?> addTransaction(
      {required TransactionModel transaction}) async {
    try {
      final transactionRefeference = await FirebaseFirestore.instance
          .collection("transaction")
          .add(transaction.copyWith(userId: userManager.user!.uid).toMap());
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

  Future<List<TransactionModel>> getOutTransaction() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: 'out')
          .where("userId", isEqualTo: userManager.user!.uid)
          .orderBy("date", descending: true)
          .get();
      return response.docs
          .map((e) => TransactionModel.fromMap(e.data()))
          .toList();
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> getInTransaction() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("type", isEqualTo: 'in')
          .where("userId", isEqualTo: userManager.user!.uid)
          .orderBy("date", descending: true)
          .get();
      return response.docs
          .map((e) => TransactionModel.fromMap(e.data()))
          .toList();
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> getTransaction() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("transaction")
          .where("userId", isEqualTo: userManager.user!.uid)
          .orderBy("date", descending: true)
          .get();
      return response.docs
          .map((e) => TransactionModel.fromMap(e.data()))
          .toList();
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
