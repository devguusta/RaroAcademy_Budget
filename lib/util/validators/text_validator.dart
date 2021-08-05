import 'package:flux_validator_dart/flux_validator_dart.dart';
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
      return null;
    }
  }
  String? validateName(String value) {
    return value.isEmpty ? "Preencha corretamente o nome" : null;
  }

   String? validatePhone(String? value){
     return value!.isEmpty ? "Preencha corretamente o campo número" : null;
     
   }

  String? cpfValidator(String value) {
   if(CPFValidator.isValid(value)) {
     return null;
   } else {
     return "Formato do CPF inválido";
   }
 } 
  
}