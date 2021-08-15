import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';
import 'package:raro_academy_budget/shared/repositories/get_types_transactions_repository.dart';
import 'package:raro_academy_budget/shared/repositories/transaction_in_repository.dart';
import 'package:raro_academy_budget/shared/repositories/transaction_out_repository.dart';

class TypesTransactionsController {
  final TypesTransactionsRepository repository = TypesTransactionsRepository();

  Future<TransactionInModel?> getInTransaction(
      {required TransactionInModel transaction}) async {
    try {
      return repository.getInTransaction(transaction: transaction);
    } catch (e) {
      throw e;
    }
  }

  Future<TransactionOutModel?> getOutTransaction(
      {required TransactionOutModel transaction}) async {
    try {
      return repository.getOutTransaction(transaction: transaction);
    } catch (e) {
      throw e;
    }
  }
}
