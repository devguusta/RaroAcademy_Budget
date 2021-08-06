
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
    return value.isEmpty ? "Preencha corretamente o nome" : null;
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
 String? validatePassword(String value, String value1) {
  //  if(value != value1) {
  //     print(value);
  //    return "As senhas não conferem";
  //  } 
   if(value.length < 8) {
     print(value);
     return 'Escolha uma senha mais forte';
   } else {
     print(value);
     return null;
   }
 }
  
}