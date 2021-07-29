import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/shared/widgets/next_button_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class InitialLoginPage extends StatefulWidget {
  const InitialLoginPage({Key? key}) : super(key: key);

  @override
  _InitialLoginPageState createState() => _InitialLoginPageState();
}

class _InitialLoginPageState extends State<InitialLoginPage> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 72,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Image.asset("assets/images/logoBudget.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 16),
              child: Text(
                "Vamos\ncomeçar!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 48,
                  fontFamily: "Roboto",
                  color: Color(0xFF44C2FD),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 52.0, top: 8),
              child: Row(
                children: [
                  Text("Novo usuário?",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Roboto",
                          letterSpacing: 0.15,
                          color: Color.fromRGBO(0, 0, 0, 0.58))),
                  Text(" Crie uma conta",
                      style: TextStyle(
                          color: AppColors.kPurple,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 0.15,
                          fontFamily: "Roboto")),
                ],
              ),
            ),
            SizedBox(
              height: 46,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputForm(
                      hintText: "Insira seu e-mail",
                      labelText: "E-mail",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 48),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                           style: TextButton.styleFrom(
                          primary: Color.fromRGBO(0, 0, 0, 0.12),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                          onPressed: (){print("inseriu email");},
                          child: Text("CONTINUAR", style: TextStyle(color: Color.fromRGBO(0,0,0, 0.26 ), fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Roboto")),
                        ),
                      ),
                    ),
                    SizedBox(height: 52),
                    Text("ou", style: TextStyle(color: Color.fromRGBO(0,0,0,58), fontSize: 16, fontFamily: "Roboto")),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          primary: Color.fromRGBO(0, 0, 0, 0.58),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {print("Logou com o google");},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/logoGoogle.png"),
                            Text("CONTINUAR COM O GOOGLE", style: TextStyle(color: Color.fromRGBO(0,0,0, 0.58 ), fontSize: 13, fontWeight: FontWeight.w500, fontFamily: "Roboto"))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:16,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(58,91,150,1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            Future.delayed(Duration(seconds: 2), () {
                              print("Olá");
                            });
                          }
                          },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/logoFacebook.png"),
                            Text("CONTINUAR COM O GOOGLE", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500, fontFamily: "Roboto"))
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
