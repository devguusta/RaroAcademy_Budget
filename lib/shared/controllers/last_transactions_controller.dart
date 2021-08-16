import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/repositories/last_transactions_repository.dart';

class LastTransactionsController {
  final LastTransactionsRepository repository = LastTransactionsRepository();

  Future lastInTransactions(
     {required TransactionInModel transaction}
  ) async {
    try{
      return repository.lastInTransactions(transaction: transaction);

    }
    catch (e) {

    }
  }
}