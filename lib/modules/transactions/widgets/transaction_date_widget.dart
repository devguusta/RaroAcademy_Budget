import 'package:flutter/material.dart';

class TransactionDateWidget extends StatelessWidget {
  final String date;
  final VoidCallback onPressed;
  const TransactionDateWidget(
      {Key? key, required this.date, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextButton(
        child: Text(
          date,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
