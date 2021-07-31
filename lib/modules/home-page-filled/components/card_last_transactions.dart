import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page-filled/components/list_view_last_transactions.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class LastTransactions extends StatelessWidget {
  const LastTransactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width * 0.9,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              // spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.14),
              offset: Offset(0, 3),
              blurRadius: 1,
            ),
          ],
          color: Color.fromRGBO(253, 253, 253, 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                "Últimas transações",
                style: AppTextStyles.kTitleHomeMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                "R\$ 398,30",
                style: AppTextStyles.kSubTitleLastTransactions,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                "No momento",
                style: AppTextStyles.kMoment,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 24.0),
              child: ListViewLastTransactions(),
            ),
          ],
        ),
      ),
    );
  }
}



