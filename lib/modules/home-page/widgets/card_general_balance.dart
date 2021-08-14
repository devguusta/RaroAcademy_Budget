import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/visible_widget.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class CardGeneralBalance extends StatefulWidget {
  const CardGeneralBalance({
    Key? key,
  }) : super(key: key);

  @override
  _CardGeneralBalanceState createState() => _CardGeneralBalanceState();
}

class _CardGeneralBalanceState extends State<CardGeneralBalance> {
  bool balanceVisible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width * 0.9,
        decoration: BoxDecoration(
          boxShadow: const [
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
          color: const Color.fromRGBO(253, 253, 253, 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const Text(
                    "Saldo geral",
                    style: AppTextStyles.kTitleHomeMedium,
                  ),
                  VisibleWidget(
                    visible: balanceVisible,
                    onPressed: () {
                      setState(() {
                        balanceVisible = !balanceVisible;
                      });
                    },
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 16,
                ),
                child: balanceVisible
                    ? Container()
                    : const Text(
                        "R\$ 3.000,00",
                        style: AppTextStyles.kSubTitleHomeMedium,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
