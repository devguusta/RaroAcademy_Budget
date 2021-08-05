import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpUseTerms extends StatefulWidget {
  
  const SignUpUseTerms({
    Key? key,
    
  }) : super(key: key);

  @override
  _SignUpUseTermsState createState() => _SignUpUseTermsState();
}

class _SignUpUseTermsState extends State<SignUpUseTerms> {
  SingingCharacter? _character = SingingCharacter.no;
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 27.0, right: 22.0),
        child: Column(
         
          
          children: [
          SizedBox(height: size.height * 0.05),
      Visibility(
        visible:
            MediaQuery.of(context).viewInsets.bottom == 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(AppImages.logoBudget),
        ),
      ),
      Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom ==0,
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: 16.0),
          child: Text("Bem-vindo!",
              style: AppTextStyles.kPrimaryTextLoginPage),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.only(left: 0.0,),
        child: SizedBox(
          child: Text(
              'Leia com atenção e aceite.',
              style: AppTextStyles.kSubTitleSignUpText),
        ),
      ),  
      SizedBox(height: size.height * 0.06),
          Text(
            'Lorem Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nque porro  est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.15,
              color: Color.fromRGBO(0, 0, 0, 0.54),
            ),
          ),
         
          Row(

            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Radio<SingingCharacter>(
                    value: SingingCharacter.yes,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() => _character = value);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:0.0),
                child: Text(
                  'Eu li e aceito os termos e condições\ne a Política de privacidade do budget.',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    letterSpacing: 0.15,
                    color: Color.fromRGBO(0, 0, 0, 0.54),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

enum SingingCharacter { yes, no }
