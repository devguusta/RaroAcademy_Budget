import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class CardDaybyDay extends StatelessWidget {
  const CardDaybyDay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        height: 202,
        width: 330,
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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dia a dia",
                      style: AppTextStyles.kTitleHomeMedium),
                  Icon(Icons.visibility,
                      color: Color.fromRGBO(52, 48, 144, 1)),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, bottom: 16, top: 8),
                  child: Text("R\$ 3.000,00",
                      style: AppTextStyles.kSubTitleHomeMedium),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, bottom: 6, top: 16),
                  child: Text("Saídas",
                      style: AppTextStyles.kTypeTransactions),
                ),
                SizedBox(width: 65),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6, top: 16),
                  child: Text("R\$ 5.000,00",
                      style: AppTextStyles.kValueDayTransactions),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  width: 185,
                  height: 11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: Color.fromRGBO(68, 194, 253, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.39),
                        blurRadius: 1,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, bottom: 6, top: 16),
                  child: Text("Entradas",
                      style: AppTextStyles.kTypeTransactions),
                ),
                SizedBox(width: 65),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 6, top: 16, right: 6),
                  child: Text("R\$8.000,00",
                      style: AppTextStyles.kValueDayTransactions),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  width: 295,
                  height: 11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: Color.fromRGBO(250, 199, 54, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.39),
                        blurRadius: 1,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}