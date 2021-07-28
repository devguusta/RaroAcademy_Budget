import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/colors.dart';
import 'package:raro_academy_budget/util/constants/text_styles.dart';

class NextButtonWidget extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onTap;

  const NextButtonWidget({
    this.buttonText = '',
    this.buttonIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.kblueGradientAppBar,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  buttonText.toUpperCase(),
                  style: AppTextStyles.kNextButtonMedium,
                ),
                SizedBox(width: 6.0),
                Icon(
                  buttonIcon,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}
