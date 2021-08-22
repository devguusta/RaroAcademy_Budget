import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';

class TransactionRepository {
  final UserManager userManager = GetIt.I<UserManager>();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference get tarefas =>
      FirebaseFirestore.instance.collection("/balances");
  String year = '';
  int month = 0;

  Future<TransactionModel?> addTransaction(
      {required TransactionModel transaction}) async {
    try {
      await _db
          .collection("transaction")
          .add(transaction.copyWith(userId: userManager.user!.uid).toMap());

      await _db
          .collection('balances')
          .doc(userManager.user!.uid)
          .get()
          .then((value) {
        double transactionValue = transaction.type == 'out'
            ? -1 * transaction.value
            : transaction.value;
        year = transaction.date.year.toString();
        month = transaction.date.month - 1;
        if (value.exists) {
          var data = value.data();
          if (data![year] != null) {
            List months = data[year];

            months[month] += transactionValue;
            var sum = 0.0;
            months.forEach((element) {
              sum += element;
            });
            _db
                .collection("balances")
                .doc(userManager.user!.uid)
                .update({year: months, "general_balance": sum});
          }
        } else {
          _db.collection('balances').doc(userManager.user!.uid).set({
            year: List.generate(
                12, (index) => index == month ? transactionValue : 0),
            'general_balance': transactionValue
          });
        }
      });
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
      // await _db
      //     .collection('transaction')
      //     .doc(transaction.transactionId)
      //     .get()
      //     .then((value) {
      //   value.data()!['value'];
      // });
    } catch (e) {
      throw e;
    }
  }

  Stream<Map<String, dynamic>?> getBalance() {
    try {
      return _db
          .collection("balances")
          .doc(userManager.user!.uid)
          .snapshots()
          .map((event) => event.data());
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
    } catch (e) {
      throw e;
    }
  }
}
