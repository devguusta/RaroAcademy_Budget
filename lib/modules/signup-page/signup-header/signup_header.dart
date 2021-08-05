import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpHeader extends StatelessWidget {
  final String text;
  const SignUpHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Image.asset(AppImages.logoBudget),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 48.0, top: 16.0),
                child: Text("Bem-vindo!",
                    style: AppTextStyles.kPrimaryTextLoginPage),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48.0, right: 57.0),
                child: SizedBox(
                  child: Text('Por favor insira seus dados no campo abaixo.', style: AppTextStyles.kSubTitleSignUpText),
                ),
              ),
              InputForm(hintText:"Email", labelText:"Email"),
              InputForm(hintText:"Senha", labelText:"Senha"),
            ],
          ),
        ),
      ),
    );
  }
}
