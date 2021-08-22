import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Validators {
  static String? validateEmail(String? email, {bool? result = true}) {
    var emailPatter = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    print("Result $result");
    if (email!.isEmpty) {
      return "Insira um endereço de email";
    } else if (!emailPatter.hasMatch(email)) {
      return "e-mail inválido";
    } else if (!result!) {
      // print(email);
      return "Não existe uma conta com esse email";
    }
  }

  String? validateName(String value) {
    String pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Campo obrigatório*';
    } else if (!regExp.hasMatch(value)) {
      return 'Porfavor, preencha o campo corretamente*';
    }
    print(value);
    return null;
  }

  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      print(value);
      return "Preencha corretamente o campo";
    } else if (value.length != 14) {
      return "Informe o ddd e o número";
    } else {
      print(value);
      return null;
    }
    //  return value!.isEmpty ? "Preencha corretamente o campo número" : null;
  }

  String? cpfValidator(String value) {
    if (CPFValidator.isValid(value)) {
      print(value);
      return null;
    } else {
      return "Formato do CPF inválido ou não existe";
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return "O campo senha é obrigatório*";
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(password)) {
      if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(password))
        return "Deve conter pelo menos um caracter maiúsculo*";
      if (!RegExp(r'^(?=.*?[a-z])').hasMatch(password))
        return "Deve conter pelo menos um caracter minúsculo*";
      if (!RegExp(r'^(?=.*?[0-9])').hasMatch(password))
        return "Deve conter pelo menos um número*";
      if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}').hasMatch(password))
        return "Deve conter pelo menos um caracter especial*";
    }
    print(password);
    return null;
  }

  String? validateConfirmPassword(String password, String confirm) {
    print(password);
    print(confirm);
    return (confirm == password) ? null : "As duas senhas não coincidem";
  }
}
