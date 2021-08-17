import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/repositories/transaction_repository.dart';

class TransactionController {
  final TransactionRepository repository = TransactionRepository();

  Future<TransactionModel?> addTransaction(
      {required TransactionModel transaction}) async {
    try {
      return repository.addTransaction(transaction: transaction);
    } catch (e) {
      throw e;
    }
  }

  Future<TransactionModel?> updateTransaction(
      {required TransactionModel transaction}) async {
    try {
      return repository.updateTransaction(transaction: transaction);
    } catch (e) {
      throw e;
    }
  }
}
