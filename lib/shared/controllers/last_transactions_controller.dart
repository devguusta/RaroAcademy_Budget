import 'package:raro_academy_budget/shared/repositories/last_transactions_repository.dart';

class LastTransactionsController {
  final LastTransactionsRepository repository = LastTransactionsRepository();

  Future lastTransactions() async {
    try{
      return repository.lastTransactions();

    }
    catch (e) {

    }
  }
}