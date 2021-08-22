import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class TransactionInInputWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FilteringTextInputFormatter? inputFormat;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final bool obscureText;
  final Widget? suffixIcon;
  const TransactionInInputWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.onChanged,
    required this.controller,
    this.inputFormat,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction, this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: TextField(
        inputFormatters: [],
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        focusNode: focusNode,
        textInputAction:  textInputAction,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kPurple,
            ),
          ),
          focusColor: AppColors.kPurple,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            letterSpacing: 0.15,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromRGBO(52, 48, 144, 1),
            letterSpacing: 0.15,
          ),
        ),
      ),
    );
  }
}
