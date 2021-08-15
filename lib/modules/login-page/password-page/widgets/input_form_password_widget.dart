import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

class InputFormPasswordWidget extends StatefulWidget {
  final String email;
  const InputFormPasswordWidget({Key? key, required this.email})
      : super(key: key);

  @override
  _InputFormPasswordWidgetState createState() =>
      _InputFormPasswordWidgetState();
}

class _InputFormPasswordWidgetState extends State<InputFormPasswordWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: "Insira seu e-mail",
            labelText: "E-mail",
            initialValue: widget.email,
            enabled: false,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 50.0),
          InputForm(
            hintText: 'Senha',
            labelText: 'Senha',
            controller: passwordController,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
