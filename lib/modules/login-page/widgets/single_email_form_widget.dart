import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/login-page/password-page/password_page.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/facebook_button_widget.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/google_button_widget.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_page.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

import 'get_started_button_widget.dart';

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
          GetStartedButtonWidget(formKey: _formKey),
          const Text(
            "ou",
            style: AppTextStyles.kSecondaryTextLoginPage,
          ),
          GoogleButtonWidget(),
          FacebookButtonWidget(),
        ],
      ),
    );
  }
}
