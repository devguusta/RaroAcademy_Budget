import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({Key? key}) : super(key: key);

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
                  Text(
                    "VOLTAR",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Row(
                children: const [
                  Text(
                    "1/4",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      letterSpacing: 0.15,
                    ),
                  ),
                ],
              )),
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
                Text(
                  "CONTINUAR",
                  style: TextStyle(
                    color: AppColors.kWhite,
                    fontFamily: 'Roboto',
                    fontSize: 14.0,
                    letterSpacing: 0.4,
                  ),
                ),
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
