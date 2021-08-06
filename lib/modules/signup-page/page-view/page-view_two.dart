import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';
import 'package:flutter/services.dart';

class PageViewTwo extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController cpfController;
  const PageViewTwo({
    Key? key,
    required this.phoneController,
    required this.cpfController,
  }) : super(key: key);

  @override
  _PageViewTwoState createState() => _PageViewTwoState();
}

class _PageViewTwoState extends State<PageViewTwo> {
   var maskFormatter = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
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
                duration: const Duration(milliseconds: 400),
                child: Image.asset(AppImages.logoBudget)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 48.0, top: 16.0),
          child: Text("Bem-vindo!", style: AppTextStyles.kPrimaryTextLoginPage),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 48.0, right: 57.0),
          child: SizedBox(
            child: Text('Mais Alguns dados.',
                style: AppTextStyles.kSubTitleSignUpText),
          ),
        ),
        SizedBox(height: size.height * 0.15),
        InputForm(
          hintText: "Telefone",
          labelText: "Telefone",
          controller: widget.phoneController,
          onChanged: (value) {},
          validator:(String? value) => Validators().validatePhone(value!),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            maskFormatter,
          ],
          
        ),
          SizedBox(height: size.height * 0.05),
        InputForm(
          hintText: "Cpf",
          labelText: "Cpf",
          controller: widget.cpfController,
          validator: (String? value) => Validators().cpfValidator(value!),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            
          ],
        ),
      ],
    );
  }
}
