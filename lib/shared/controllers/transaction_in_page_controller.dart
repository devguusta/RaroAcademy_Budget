import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/repositories/transaction_in_repository.dart';

class TransactionInPageController {
  final TransactionInRepository repository = TransactionInRepository();

  Future<TransactionInModel?> addTransaction(
      {required TransactionInModel transaction}) async {
    try {
      return repository.addTransaction(transaction: transaction);
    } catch (e) {
      throw e;
    }
  }
}
