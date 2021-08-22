// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionManager on _TransactionManagerBase, Store {
  final _$dateTimeAtom = Atom(name: '_TransactionManagerBase.dateTime');

  @override
  DateTime? get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime? value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  final _$changeDateTimeAsyncAction =
      AsyncAction('_TransactionManagerBase.changeDateTime');

  @override
  Future<void> changeDateTime(DateTime value) {
    return _$changeDateTimeAsyncAction.run(() => super.changeDateTime(value));
  }

  @override
  String toString() {
    return '''
dateTime: ${dateTime}
    ''';
  }
}
