import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

class PageViewFor extends StatefulWidget {
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
 
  PageViewFor({
    Key? key,
    this.passwordController,
    this.confirmPasswordController,
   
  }) : super(key: key);

  @override
  _PageViewForState createState() => _PageViewForState();
}

class _PageViewForState extends State<PageViewFor> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.05),
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: AnimatedCard(
                direction: AnimatedCardDirection.top,
                duration: const Duration(milliseconds: 600),
                child: Image.asset(AppImages.logoBudget)),
          ),
        ),
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0,
          child: Padding(
            padding: EdgeInsets.only(left: 48.0, top: 16.0),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right,
              duration: const Duration(milliseconds: 600),
              child: Text("Bem-vindo!",
                  style: AppTextStyles.kPrimaryTextLoginPage),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 48.0, right: 57.0),
          child: SizedBox(
            child: Text('Agora crie sua senha\ncontendo:',
                style: AppTextStyles.kSubTitleSignUpText),
          ),
        ),
        SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.only(left: 48.0),
          child: Text(
            '• pelo menos oito caracteres',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.15,
              color: Color.fromRGBO(0, 0, 0, 0.54),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 48.0),
          child: Text(
            '• letras maiúsculas, letras\n minúsculas, números e símbolos',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.15,
              color: Color.fromRGBO(0, 0, 0, 0.54),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        InputForm(
          hintText: "Crie uma senha",
          labelText: "Senha",
          controller: widget.passwordController,
          onChanged: (String value) => {},
          validator: (String? value) {
           
            if(value!.length < 8) {
              return 'No minímo 8 dígitos';
            }
          },
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
        SizedBox(height: size.height * 0.05),
        InputForm(
          keyboardType: TextInputType.visiblePassword,
          hintText: "Confirme sua senha",
          labelText: "Confirmar senha",
          onChanged: (String value) =>{},
          controller: widget.confirmPasswordController,
          validator: (String? value) => Validators().validatePassword(value!, widget.passwordController!.text),
          obscureText: true,
        ),
      ],
    );
  }
}
