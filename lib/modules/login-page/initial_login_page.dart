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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.1),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  duration: const Duration(milliseconds: 400),
                  child: Image.asset(AppImages.logoBudget),
                ),
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
                      SignUpPage.id;
                    }, // navegar para signup
                    child: const Text(
                      " Crie uma conta",
                      style: AppTextStyles.kSecondaryBoldTextLoginPage,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            const SingleEmailFormWidget(),
          ],
        ),
      ),
    );
  }
}