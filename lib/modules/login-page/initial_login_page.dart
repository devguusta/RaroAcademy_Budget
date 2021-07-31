import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page-filled/home_page.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

class InitialLoginPage extends StatefulWidget {
  static const String id = '/initial-login';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 72),
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Image.asset(AppImages.logoBudget),
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
                children: const [
                  Text(
                    "Novo usuário?",
                    style: AppTextStyles.kSecondaryTextLoginPage,
                  ),
                  Text(
                    " Crie uma conta",
                    style: AppTextStyles.kSecondaryBoldTextLoginPage,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 46),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputForm(
                    hintText: "Insira seu e-mail",
                    labelText: "E-mail",
                    controller: emailController,
                    onChanged: (value) {},
                    validator: (String? value) =>
                        Validators.validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 48),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          primary: AppColors.kContinueButton,
                          backgroundColor: AppColors.kContinueButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                            context,
                            HomePage.id,
                            );
                          }
                        },
                        child: const Text(
                          "CONTINUAR",
                          style: AppTextStyles.kContinueTextButton,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 52),
                  const Text(
                    "ou",
                    style: AppTextStyles.kSecondaryTextLoginPage,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: AppColors.kTextButtonColor,
                        backgroundColor: AppColors.kWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.logoGoogle),
                          const Text(
                            "CONTINUAR COM O GOOGLE",
                            style: AppTextStyles.kTextButtonGoogle,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: AppColors.kWhite,
                        backgroundColor:
                            AppColors.kBackgroundFacebookButtonColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.logoFacebook),
                          const Text(
                            "CONTINUAR COM O FACEBOOK",
                            style: AppTextStyles.kTextButtonFacebook,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}