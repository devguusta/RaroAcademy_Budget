import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: 'Nome',
            labelText: 'Nome',
            controller: nameController,
            onChanged: (value) {},
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 50.0),
          InputForm(
            hintText: 'E-mail',
            labelText: 'E-mail',
            controller: emailController,
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
