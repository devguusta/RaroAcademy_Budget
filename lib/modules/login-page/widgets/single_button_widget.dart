import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page/home_page.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SingleButtonWidget extends StatefulWidget {
  const SingleButtonWidget({Key? key}) : super(key: key);

  @override
  _SingleButtonWidgetState createState() => _SingleButtonWidgetState();
}

class _SingleButtonWidgetState extends State<SingleButtonWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        primary: AppColors.kContinueButton,
        backgroundColor: AppColors.kContinueButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushReplacementNamed(
            context,
            HomePage.id,
          );
        }
      },
      child: const Text(
        "CONTINUAR",
        style: AppTextStyles.kContinueTextButton,
      ),
    );
  }
}
