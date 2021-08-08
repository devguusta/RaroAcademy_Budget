import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/login-page/password-page/widgets/footer_password_widget.dart';
import 'package:raro_academy_budget/modules/login-page/password-page/widgets/input_form_password_widget.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class PasswordPage extends StatefulWidget {
  static const String id = '/password';
  const PasswordPage({Key? key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                "Insira sua senha",
                style: AppTextStyles.kPrimaryTextLoginPage,
              ),
            ),
            const SizedBox(height: 100.0),
            const InputFormPasswordWidget(),
            const SizedBox(height: 16.0),
            const FooterPasswordWidget(),
          ],
        ),
      ),
    );
  }
}
