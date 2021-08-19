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

  Stream<List<TransactionModel>> getOutTransaction() {
    try {
      return repository.getOutTransaction();
    } catch (e) {
      throw e;
    }
  }

  Stream<List<TransactionModel>> getInTransaction()  {
    try {
      return repository.getInTransaction();
    } catch (e) {
      throw e;
    }
  }

  Stream<List<TransactionModel>> getTransaction()  {
    try {
      return repository.getTransaction();
    } catch (e) {
      throw e;
    }
  }
  Stream<List<TransactionModel>> getLastTransaction() {
    try{
      return repository.getLastTransaction();
    } catch (e) {
      throw e;
    }
  }

  // Stream<List<TransactionModel?>> getInTransaction(
  //   {required TransactionModel transaction}
  // ) async* {
  //   try {
  //      repository.getInTransaction(transaction: transaction);
  //   } catch (e) {
  //     throw e;
  //   }
  //  }
}
