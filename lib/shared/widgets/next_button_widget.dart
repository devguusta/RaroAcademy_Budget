import 'package:flutter/material.dart';

import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class NextButtonWidget extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onTap;
  final IconData? prefixIcon;

  const NextButtonWidget({
    Key? key,
    this.buttonText = '',
    this.buttonIcon,
    this.onTap,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
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
              Icon(
                prefixIcon,
                color: Colors.white,
              ),
             const SizedBox(width: 12.0),
              Text(
                buttonText.toUpperCase(),
                style: AppTextStyles.kNextButtonMedium,
              ),
              const SizedBox(width: 0.0),
              Icon(
                buttonIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}