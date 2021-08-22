import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_icons.dart';

class TransactionIconWidget extends StatefulWidget {
  final String category;
  const TransactionIconWidget({
    required this.category,
  });

  @override
  _TransactionIconWidgetState createState() => _TransactionIconWidgetState();
}

class _TransactionIconWidgetState extends State<TransactionIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: widget.category == 'Refeição'
            ? AppColors.kYellow
            : widget.category == 'Viagem'
                ? AppColors.kPink
                : widget.category == 'Transporte'
                    ? AppColors.kGreen
                    : widget.category == 'Pagamentos'
                        ? AppColors.kPurple
                        : widget.category == 'Educação'
                            ? AppColors.kCyan
                            : widget.category == 'Outros'
                                ? AppColors.kLilac
                                : Color.fromRGBO(52, 48, 144, 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(
        widget.category == 'Pix'
            ? AppIcons.kPix
            : widget.category == 'Boleto'
                ? AppIcons.kBoleto
                : widget.category == 'Dinheiro'
                    ? AppIcons.kMoney
                    : widget.category == 'Doc'
                        ? AppIcons.kDoc
                        : widget.category == 'Ted'
                            ? AppIcons.kTed
                            : widget.category == 'Viagem'
                                ? AppIcons.kTravel
                                : widget.category == 'Educação'
                                    ? AppIcons.kEducation
                                    : widget.category == 'Refeição'
                                        ? AppIcons.kMeal
                                        : widget.category == 'Pagamentos'
                                            ? AppIcons.kPayments
                                            : widget.category == 'Transporte'
                                                ? AppIcons.kTransport
                                                : AppIcons.kOthers,
        color: Colors.white,
      ),
    );
  }
}
