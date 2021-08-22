import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.kblueGradientAppBar,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 28,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          "Cadastro",
          style: TextStyle(
            color: AppColors.kWhite,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }
}
