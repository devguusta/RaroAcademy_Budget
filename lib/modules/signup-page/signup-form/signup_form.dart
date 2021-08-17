import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';

class SignUpFormName extends StatefulWidget {
  SignUpFormName({
    Key? key,
  }) : super(key: key);

  @override
  createState() => _SignUpFormStateName();
}

class _SignUpFormStateName extends State<SignUpFormName> {
  TextEditingController nameController = TextEditingController();
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
        ],
      ),
    );
  }
}

class SignUpFormEmail extends StatefulWidget {
  const SignUpFormEmail({Key? key}) : super(key: key);

  @override
  createState() => _SignUpFormStateEmail();
}

class _SignUpFormStateEmail extends State<SignUpFormEmail> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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

class SignUpFormPhone extends StatefulWidget {
  const SignUpFormPhone({Key? key}) : super(key: key);

  @override
  createState() => _SignUpFormStatePhone();
}

class _SignUpFormStatePhone extends State<SignUpFormPhone> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: 'Telefone',
            labelText: 'Telefone',
            controller: phoneController,
            onChanged: (value) {},
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}

class SignUpFormCPF extends StatefulWidget {
  const SignUpFormCPF({Key? key}) : super(key: key);

  @override
  createState() => _SignUpFormStateCPF();
}

class _SignUpFormStateCPF extends State<SignUpFormCPF> {
  TextEditingController cpfController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: 'CPF',
            labelText: 'CPF',
            controller: cpfController,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

class SignUpFormPassword extends StatefulWidget {
  final bool enable;
  SignUpFormPassword({Key? key, required this.enable}) : super(key: key);

  @override
  createState() => _SignUpFormStatePassword();
}

class _SignUpFormStatePassword extends State<SignUpFormPassword> {
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: 'Crie uma senha',
            labelText: 'Senha',
            enabled: widget.enable,
            controller: passwordController,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

class SignUpFormRepeatPassword extends StatefulWidget {
  final bool enable;
  SignUpFormRepeatPassword({Key? key, required this.enable}) : super(key: key);

  @override
  createState() => _SignUpFormStateRepeatPassword();
}

class _SignUpFormStateRepeatPassword extends State<SignUpFormRepeatPassword> {
  TextEditingController repeatPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: 'Confirme sua senha',
            labelText: 'Confirme sua senha',
            controller: repeatPasswordController,
            enabled: widget.enable,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
