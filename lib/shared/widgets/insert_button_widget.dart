import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class InsertButton extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final iconPosition;
  final VoidCallback? onTap;

  const InsertButton({
    Key? key,
    this.buttonText = '',
    this.buttonIcon,
    this.iconPosition,
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
                Icons.add,
                color: Colors.white,
              ),
              const SizedBox(width: 6.0),
              Text(
                buttonText.toUpperCase(),
                style: AppTextStyles.kNextButtonMedium,
              ),
              const SizedBox(width: 6.0),
            ],
          ),
        ),
      ),
    );
  }
}
