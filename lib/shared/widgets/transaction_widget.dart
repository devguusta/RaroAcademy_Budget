import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
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
                        style: AppTextStyles.kTitleListLastTransictions),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("02/08/2021",
                        style: AppTextStyles.kDateLastTransictions),
                  ),
                ],
              ),
            ),
            // SizedBox(width: size.width * 0.25),
          ],
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Text("-R\$ 25,00",
                    style: AppTextStyles.kValueLastTransictions
                        .copyWith(color: Color.fromRGBO(52, 48, 144, 1))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
