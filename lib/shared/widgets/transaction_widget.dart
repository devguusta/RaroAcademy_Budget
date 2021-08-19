import 'package:flutter/material.dart';

import 'package:raro_academy_budget/modules/transactions/widgets/transaction_icon_widget.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class TransactionWidget extends StatefulWidget {
  final String type;
  final String description;
  final String date;
  final String value;
  final TextStyle textStyle;
  final String category;
  

  const TransactionWidget({
    Key? key,
    required this.type,
    required this.description,
    required this.date,
    required this.value,
    required this.textStyle,
    required this.category,
    
  }) : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: [
              TransactionIconWidget(
                category: widget.category,
              ),
              SizedBox(width: 8.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0.0,
                  bottom: 8,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Text(
                          widget.type == 'in'
                              ? "${widget.category + ' - ' + widget.description}"
                              : widget.category,
                          style: AppTextStyles.kTitleListLastTransictions,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: AppTextStyles.kDateLastTransictions,
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(width: size.width * 0.25),
            ],
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0, right: 16.0),
                    child: Text(
                      widget.value,
                      style: widget.textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
