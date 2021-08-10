import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/login-page/password-page/password_page.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/facebook_button_widget.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/google_button_widget.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_page.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

class SingleEmailFormWidget extends StatefulWidget {
  const SingleEmailFormWidget({Key? key}) : super(key: key);

  @override
  _SingleEmailFormWidgetState createState() => _SingleEmailFormWidgetState();
}

class _SingleEmailFormWidgetState extends State<SingleEmailFormWidget> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: "Insira seu e-mail",
            labelText: "E-mail",
            controller: emailController,
            onChanged: (value) {},
            validator: (String? value) => Validators.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 48),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
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
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          const Text(
            "ou",
            style: AppTextStyles.kSecondaryTextLoginPage,
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.0),
            child: Expanded(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: GoogleButtonWidget(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.0),
            child: Expanded(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: FacebookButtonWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}