
import 'package:cpf_cnpj_validator/cpf_validator.dart';
class Validators {
  static String? validateEmail(String? email) {
    var emailPatter = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if(email!.isEmpty){
      return "Insira um endereço de email";
    }
    else if(!emailPatter.hasMatch(email)){
      return "e-mail inválido";
    }
    else {
      print(email);
      return null;
    }
  }
  String? validateName(String value) {

    String pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'The name parameter is mandatory*';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid name*';
    }
    return null;
  
  }
   String? validatePhone(String? value){
     if(value!.isEmpty) {
       print(value);
       return "Preencha corretamente o campo";
     } else if(value.length != 11) {
       return "Informe o ddd e o número";
     }
     
     else {
       print(value);
       return null;
     }
    //  return value!.isEmpty ? "Preencha corretamente o campo número" : null;
     
   }

  String? cpfValidator(String value) {
   if(CPFValidator.isValid(value)) {
     return null;
   } else {
     return "Formato do CPF inválido";
   }
 } 

  String? validatePassword(String value) {
    if (value.isEmpty) return "O campo senha é obrigatório*";
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value))
        return "Deve conter pelo menos um caracter maiúsculo*";
      if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value))
        return "Deve conter pelo menos um caracter minúsculo*";
      if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value))
        return "Deve conter pelo menos um número*";
      if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}').hasMatch(value))
        return "Deve conter pelo menos um caracter especial*";
    }
    return null;
  }



   String? validateConfirmPassword(String value, String value1) {
    if (value.isEmpty) {
      return "O campo é obrigatório*";
    } else if (value != value1) {
      return 'As senhas não coincidem*';
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value))
        return "Deve conter pelo menos um caracter maiúsculo*";
      if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value))
        return "Deve conter pelo menos um caracter minúsculo*";
      if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value))
        return "Deve conter pelo menos um número*";
      if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}').hasMatch(value))
        return "Deve conter pelo menos um caracter especial*";
    }
    return null;
  }
  
}