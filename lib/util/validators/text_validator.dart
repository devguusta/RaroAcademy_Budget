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
  
}