import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_academy_budget/modules/transaction-out-page/transaction_out_model.dart';

class TransactionOutRepository {
  Future<TransactionOutModel?> addTransaction(
      {required TransactionOutModel transaction}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("/transaction")
          .add(transaction.toMap());

      print(response);
    } catch (e) {
      throw e;
    }
  }

  Future<TransactionOutModel?> getTransaction(
      {required TransactionOutModel transaction}) async {
    try {
      final getTransaction = await FirebaseFirestore.instance
          .collection("/transaction")
          .doc()
          .get();

      TransactionOutModel.fromMap(getTransaction.data()!);

      print(getTransaction);
    } catch (e) {
      throw e;
    }
  }
}
