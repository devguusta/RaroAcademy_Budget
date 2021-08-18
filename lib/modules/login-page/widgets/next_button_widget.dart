import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class NextButtonWidget extends StatefulWidget {
  const NextButtonWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    this.onPressed,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final VoidCallback? onPressed;

  @override
  _NextButtonWidgetState createState() => _NextButtonWidgetState();
}

class _NextButtonWidgetState extends State<NextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    print('botão reiniciado');
    return Padding(
      padding: const EdgeInsets.only(right: 48.0, top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: MaterialButton(
            padding: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            disabledColor: Color.fromRGBO(0, 0, 0, 0.12),
            onPressed: widget.onPressed,
            child: Ink(
              decoration: BoxDecoration(
                  gradient:
                      widget.onPressed != null ? AppColors.kBlueGradient : null,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "CONTINUAR",
                    style: AppTextStyles.kLoginNextButton,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
