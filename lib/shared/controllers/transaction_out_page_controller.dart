import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';
import 'package:raro_academy_budget/shared/repositories/transaction_out_repository.dart';

class TransactionOutController {
  final TransactionOutRepository repository = TransactionOutRepository();

  Future<TransactionOutModel?> addTransaction(
      {required TransactionOutModel transaction}) async {
    try {
      return repository.addTransaction(transaction: transaction);
    } catch (e) {
      throw e;
    }
  }
}
