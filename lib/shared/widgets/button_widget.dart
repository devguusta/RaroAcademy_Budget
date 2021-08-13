import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String? buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onTap;

  const ButtonWidget({
    Key? key,
    this.buttonText = '',
    this.buttonIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(24.0),
      ),
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.kblueGradientAppBar,
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                buttonIcon,
                color: Colors.white,
              ),
              Text(
                buttonText!.toUpperCase(),
                style: AppTextStyles.kNextButtonMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
