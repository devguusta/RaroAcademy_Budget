import 'package:flutter/material.dart';

import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpFooter extends StatelessWidget {
  final String page;
  final VoidCallback? onPressed;
  final VoidCallback? onBack;
  const SignUpFooter({
    Key? key,
    required this.page,
    this.onPressed,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: GestureDetector(
                 onTap: onBack,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(0, 0, 0, 26),
                    ),
                    SizedBox(width: 11.0),
                    Text("VOLTAR",
                        style: AppTextStyles.kBackSignUpButton),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Row(
              children: [
                Text('$page/4', style: AppTextStyles.kPaginationSignUpButton),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 12),
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(24.0),
              ),
              onTap: onPressed,
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
                     
                      Text(
                        "Continuar".toUpperCase(),
                        style: AppTextStyles.kForwadSignUpButton,
                      ),
                       SizedBox(width: 12.0),
                      const SizedBox(width: 0.0),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}