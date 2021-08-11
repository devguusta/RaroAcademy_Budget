import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/single_email_form_widget.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_page.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class InitialLoginPage extends StatefulWidget {
  static const String id = '/initial-login';
  const InitialLoginPage({Key? key}) : super(key: key);

  @override
  _InitialLoginPageState createState() => _InitialLoginPageState();
}

class _InitialLoginPageState extends State<InitialLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 48.0),
                  child: AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    duration: const Duration(milliseconds: 200),
                    child: Image.asset(AppImages.logoBudget),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 48.0, top: 16),
                  child: Text(
                    "Vamos\ncomeçar!",
                    style: AppTextStyles.kPrimaryTextLoginPage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 52.0, top: 8),
                  child: Row(
                    children: [
                      const Text(
                        "Novo usuário?",
                        style: AppTextStyles.kSecondaryTextLoginPage,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('crie uma conta / tela de signup');
                        }, // navegar para signup
                        child: const Text(
                          " Crie uma conta",
                          style: AppTextStyles.kSecondaryBoldTextLoginPage,
                        ),
                      ),
                    ],
                  ),
                ),
                const SingleEmailFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
