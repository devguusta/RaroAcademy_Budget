import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_page.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class GetStartedButtonWidget extends StatefulWidget {
  const GetStartedButtonWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  _GetStartedButtonWidgetState createState() => _GetStartedButtonWidgetState();
}

class _GetStartedButtonWidgetState extends State<GetStartedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 48.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: AppColors.kContinueButton,
            backgroundColor: AppColors.kContinueButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            if (widget._formKey.currentState!.validate()) {
              Navigator.pushReplacementNamed(
                context,
                SignUpPage.id,
              );
            }
          },
          child: const Text(
            "CONTINUAR",
            style: AppTextStyles.kContinueTextButton,
          ),
        ),
      ),
    );
  }
}
