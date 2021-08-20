import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';

class TransactionRepository {
  final UserManager userManager = GetIt.I<UserManager>();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<TransactionModel?> addTransaction(
      {required TransactionModel transaction}) async {
    try {
      final transactionRefeference = await _db
          .collection("transaction")
          .add(transaction.copyWith(userId: userManager.user!.uid).toMap());
      // int month = transaction.date.month;
      // var value = transaction.value;

      // var balanceSnapshot =
      //     await _db.collection('balances').doc(userManager.user!.uid).get();

      print("document $transactionRefeference added");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<TransactionModel?> updateTransaction(
      {required TransactionModel transaction}) async {
    try {
      final transactionRefeference = _db
          .collection("transaction")
          .doc(transaction.transactionId)
          .update(transaction.toMap());
      print("Updated $transactionRefeference");
    } catch (e) {
      throw e;
    }
  }

  Stream<List<TransactionModel>> getOutTransaction() {
    try {
      return _db
          .collection("transaction")
          .where("type", isEqualTo: 'out')
          .where("userId", isEqualTo: userManager.user!.uid)
          .orderBy("date", descending: true)
          .snapshots()
          .map((e) => e.docs
              .map((item) => TransactionModel.fromMap(item.data())
                  .copyWith(transactionId: item.id))
              .toList());
    } catch (e) {
      throw e;
    }
  }

  Stream<List<TransactionModel>> getInTransaction() {
    try {
      return _db
          .collection("transaction")
          .where("type", isEqualTo: 'in')
          .where("userId", isEqualTo: userManager.user!.uid)
          .where("field")
          .orderBy("date", descending: true)
          .snapshots()
          .map((e) => e.docs
              .map((item) => TransactionModel.fromMap(item.data())
                  .copyWith(transactionId: item.id))
              .toList());
    } catch (e) {
      throw e;
    }
  }

  Stream<List<TransactionModel>> getTransaction() {
    try {
      return _db
          .collection("transaction")
          .where("userId", isEqualTo: userManager.user!.uid)
          .orderBy("date", descending: true)
          .snapshots()
          .map((e) => e.docs
              .map((item) => TransactionModel.fromMap(item.data())
                  .copyWith(transactionId: item.id))
              .toList());
    } catch (e) {
      throw e;
    }
  }

  Stream<List<TransactionModel>> getLastTransaction() {
    try {
      return _db
          .collection("transaction")
          .where("userId", isEqualTo: userManager.user!.uid)
          .orderBy("date", descending: true)
          .limit(3)
          .snapshots()
          .map((e) => e.docs
              .map((item) => TransactionModel.fromMap(item.data()))
              .toList());
      // return response.docs.map((e) => TransactionModel.fromMap(e.data())).toList();
    } catch (e) {
      throw e;
    }
  }
}
