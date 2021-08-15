import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_widget.dart';

class ListViewLastTransactions extends StatefulWidget {
  const ListViewLastTransactions({
    Key? key,
  }) : super(key: key);

  @override
  _ListViewLastTransactionsState createState() =>
      _ListViewLastTransactionsState();
}

class _ListViewLastTransactionsState extends State<ListViewLastTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 2,
          itemBuilder: (_, index) => const TransactionWidget(),
        ),
      ],
    );
  }
}
