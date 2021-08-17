import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/controllers/login_controller.dart';
import 'package:raro_academy_budget/modules/login-page/password-page/password_page.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/facebook_button_widget.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/google_button_widget.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

import 'next_button_widget.dart';

class SingleEmailFormWidget extends StatefulWidget {
  const SingleEmailFormWidget({Key? key}) : super(key: key);

  @override
  _SingleEmailFormWidgetState createState() => _SingleEmailFormWidgetState();
}

class _SingleEmailFormWidgetState extends State<SingleEmailFormWidget> {
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController loginController = LoginController();
  String? email;

  bool _enabled = false;
  bool result = true;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (_enabled) {
      _onPressed = () async {
        result =
            await loginController.containsEmail(email: _inputController.text);
        print("result 1: $result");
        setState(() {});
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          print(_inputController.text);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => PasswordPage(email: _inputController.text)));
        }
      };
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: "Insira seu e-mail",
            labelText: "E-mail",
            controller: _inputController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (value.length == 1) {
                  setState(() {
                    _enabled = true;
                  });
                }
              } else {
                setState(
                  () {
                    _enabled = false;
                  },
                );
              }
            },
            validator: (String? value) =>
                Validators.validateEmail(value, result: result),
            keyboardType: TextInputType.emailAddress,
          ),
          NextButtonWidget(formKey: _formKey, onPressed: _onPressed),
          const Text("ou", style: AppTextStyles.kSecondaryTextLoginPage),
          const GoogleButtonWidget(),
          const FacebookButtonWidget(),
        ],
      ),
    );
  }
}
