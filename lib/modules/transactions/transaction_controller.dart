import 'package:mobx/mobx.dart';
part 'transaction_controller.g.dart';

class TransactionManager = _TransactionManagerBase with _$TransactionManager;

abstract class _TransactionManagerBase with Store {
   @observable
  DateTime? dateTime;
  
  @action
  Future<void> changeDateTime(DateTime value)async{
    dateTime = value;

  }
  
}