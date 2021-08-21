import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

class PageViewOne extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;
  const PageViewOne({
    Key? key,
    required this.emailController,
    required this.nameController,
  }) : super(key: key);

  @override
  _PageViewOneState createState() => _PageViewOneState();
}

class _PageViewOneState extends State<PageViewOne> {
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
              child: Image.asset(AppImages.logoBudget),
            ),
          ),
        ),
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 48.0, top: 16.0),
            child: AnimatedCard(
              direction: AnimatedCardDirection.right,
              duration: const Duration(milliseconds: 600),
              child: const Text(
                "Bem-vindo!",
                style: AppTextStyles.kPrimaryTextLoginPage,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 48.0,
            right: 57.0,
          ),
          child: SizedBox(
            child: Text(
              'Por favor insira seus dados no campo abaixo.',
              style: AppTextStyles.kSubTitleSignUpText,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.1),
        InputForm(
          hintText: "Nome",
          labelText: "Nome",
          controller: widget.nameController,
          validator: (String? value) => Validators().validateName(value!),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: size.height * 0.05),
        InputForm(
          hintText: "Email",
          labelText: "Email",
          controller: widget.emailController,
          onChanged: (value) {},
          validator: (String? value) => Validators.validateEmail(value),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
           
        ),
      ],
    );
  }
}
