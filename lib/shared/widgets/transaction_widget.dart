import 'package:flutter/material.dart';

import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class TransactionWidget extends StatefulWidget {
  final String description;
  final String date;
  final String value;
  final IconData icon;
  final Color color;
  
  const TransactionWidget({
    Key? key,
    required this.description,
    required this.date,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
  
}

class _TransactionWidgetState extends State<TransactionWidget> {
  
 
 
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
                color: widget.color,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 0.0,
                bottom: 8,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: Text(
                      widget.description,
                      style: AppTextStyles.kTitleListLastTransictions,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      widget.date,
                      style: AppTextStyles.kDateLastTransictions,
                    ),
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
                padding: EdgeInsets.only(bottom: 8.0, right: 16.0),
                child: Text(
                  widget.value,
                  style: AppTextStyles.kValueLastTransictions,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
