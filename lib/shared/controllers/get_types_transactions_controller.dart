
import 'package:raro_academy_budget/shared/models/transaction_in_model.dart';
import 'package:raro_academy_budget/shared/models/transaction_out_model.dart';
import 'package:raro_academy_budget/shared/repositories/get_types_transactions_repository.dart';

class TypesTransactionsController {
  final TypesTransactionsRepository repository = TypesTransactionsRepository();
  late TransactionInModel balanceIn;
  late TransactionOutModel balanceOut;



  Stream<List<TransactionInModel?>> getInTransaction(
      {required TransactionInModel transaction}) async* {
    try {
      yield* repository.getInTransaction(transaction: transaction);
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
  // Future generalBalance(
  //   {required TransactionOutModel, required TransactionInModel}
  // ) {
  //   try{
  //     final balance = 

  //   } catch (e) {
  //     throw e;
  //   }

  // }
}
