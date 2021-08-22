import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/signup/signup_manager.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpUseTerms extends StatefulWidget {
  final bool? state;
  final Widget? childRadio;

  const SignUpUseTerms({
    Key? key,
    this.state,
    this.childRadio,
  }) : super(key: key);

  @override
  _SignUpUseTermsState createState() => _SignUpUseTermsState();
}

class _SignUpUseTermsState extends State<SignUpUseTerms> {
  final controller = SignUpManager();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),
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
            padding: EdgeInsets.only(left: 48.0, top: 8.0),
            child: Text(
              "Bem-vindo!",
              style: AppTextStyles.kPrimaryTextLoginPage,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 48.0),
            child: Text(
              'Leia com atenção e aceite.',
              style: AppTextStyles.kSubTitleSignUpText,
            ),
          ),
          SizedBox(height: size.height * 0.06),
          const Padding(
            padding: EdgeInsets.only(left: 36, right: 36, bottom: 24.0),
            child: Text(
              'Lorem Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nque porro  est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.',
              style: AppTextStyles.kPasswordTextLogin,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 0),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0, left: 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: widget.childRadio,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Eu li e aceito os termos e condições\ne a Política de privacidade do budget.',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.kPasswordTextLogin,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum SingingCharacter { yes, no }
