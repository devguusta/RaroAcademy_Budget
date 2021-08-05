import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpFooter extends StatelessWidget {
  final String page;
  const SignUpFooter({Key? key, required this.page}) : super(key: key);

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
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(0, 0, 0, 26),
                  ),
                  SizedBox(width: 11.0),
                  Text("VOLTAR", style: AppTextStyles.kBackSignUpButton),
                ],
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
          ElevatedButton(
            style: TextButton.styleFrom(
              primary: AppColors.kContinueButton,
              backgroundColor: AppColors.kPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("CONTINUAR", style: AppTextStyles.kForwadSignUpButton),
                SizedBox(width: 11.0),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.kWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
