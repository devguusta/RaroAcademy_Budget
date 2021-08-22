import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

import 'button_widget.dart';

class TransactionPageWidget extends StatelessWidget {
  final String? pageTitle;
  final List<Widget>? children;
  final ButtonWidget? button;
  final int? type;

  const TransactionPageWidget({
    this.type,
    this.pageTitle,
    this.children,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.kblueGradient2,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 28,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    pageTitle!,
                    style: AppTextStyles.kTextTrasanctionHeader,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(gradient: AppColors.kwhiteGradient),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          color: Color(0xFFFDFDFD),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 1),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.14),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: -1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.022),
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: children!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: button!,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
