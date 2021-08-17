import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class InputForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? initialValue;
  final bool? enabled;
  const InputForm({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.initialValue,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: TextFormField(
        initialValue: initialValue,
        enabled: enabled,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
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
