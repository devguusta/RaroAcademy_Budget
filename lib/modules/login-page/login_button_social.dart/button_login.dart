import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class ButtonLogin extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final IconData icon;
  const ButtonLogin({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(16),
      width: size.width * 0.9,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          primary: AppColors.kTextButtonColor,
          backgroundColor: AppColors.kWhite,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            )
          ],
        ),
      ),
    );
  }
}
