import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class LastTransactions extends StatelessWidget {
  const LastTransactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 330,
        height: 200,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 180, 0, 1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(Icons.fastfood, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, bottom: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: 4),
                              child: Text("Refeição",
                                  style:
                                      AppTextStyles.kTitleListLastTransictions),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("02/08/2021",
                                  style: AppTextStyles.kDateLastTransictions),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, bottom: 8,),
                        child: Text("-R\$ 25,00",
                            style: AppTextStyles.kValueLastTransictions),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
