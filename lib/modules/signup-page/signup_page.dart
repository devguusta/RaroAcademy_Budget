import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-footer/signup_footer.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-form/signup_form.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-header/signup_header.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-passwords/signup_passwords.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-use-terms/signup_use_terms.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpPage extends StatefulWidget {
  static const String id = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: [
        Scaffold(
          body: Stack(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    SignUpHeader(
                      text: 'Por favor insira seus dados no campo abaixo.',
                    ),
                    SizedBox(height: 130.0),
                    SignUpFormName(),
                    SizedBox(height: 50.0),
                    SignUpFormEmail(),
                  ],
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 22.0,
                        right: 16.0,
                        bottom: 16.0,
                      ),
                      child: SignUpFooter(page: '1'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          body: Stack(
            children: [
              Expanded(
                  child: Column(
                children: const [
                  SignUpHeader(text: 'Mais alguns dados.'),
                  SizedBox(height: 162.0),
                  SignUpFormPhone(),
                  SizedBox(height: 50.0),
                  SignUpFormCPF(),
                ],
              )),
              Expanded(
                child: Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 22.0,
                        right: 16.0,
                        bottom: 16.0,
                      ),
                      child: SignUpFooter(page: '2'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          body: Stack(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    SignUpHeader(text: 'Leia com atenção e aceite.'),
                    SizedBox(height: 130.0),
                    SignUpUseTerms(),
                  ],
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 22.0,
                        right: 16.0,
                        bottom: 16.0,
                      ),
                      child: SignUpFooter(page: '3'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          body: Stack(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    SignUpHeader(text: 'Agora crie sua senha contendo:'),
                    SizedBox(height: 29.0),
                    SignUpPasswords(),
                  ],
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 22.0,
                        right: 16.0,
                        bottom: 16.0,
                      ),
                      child: SignUpFooter(page: '4'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Scaffold(
          body: Stack(
            children: [
              Image.asset(
                AppImages.sucessRegisterImage,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black38,
                height: double.infinity,
                width: double.infinity,
              ),
              Image.asset(
                AppImages.maskImage,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                right: 93.0,
                left: 93.0,
                child: Image.asset(
                  AppImages.iconBudgetLarge,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.45,
                left: 60.0,
                child: const SizedBox(
                  width: 300.0,
                  child: Text(
                    'Agora sim!\nVocê terá o controle financeiro nas suas mãos!',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.kCyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 34.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.85,
                left: 60.0,
                child: SizedBox(
                  height: 36.0,
                  width: 108.0,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: AppColors.kContinueButton,
                      backgroundColor: AppColors.kCyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "VAMO LÁ!",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
