import 'package:flutter/material.dart';

import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class SignUpFooter extends StatelessWidget {
  final String page;

  final VoidCallback? onPressed;
  final VoidCallback? onBack;
  SignUpFooter(
      {Key? key,
      required this.page,
      this.onPressed,
      this.onBack,
      this.loading = false})
      : super(key: key);

  bool loading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 48.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: GestureDetector(
                    onTap: loading ? null : onBack,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Color.fromRGBO(0, 0, 0, 26),
                        ),
                        const SizedBox(width: 11.0),
                        Text(
                          "Voltar".toUpperCase(),
                          style: AppTextStyles.kBackSignUpButton,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('$page/4', style: AppTextStyles.kPaginationSignUpButton),
                ],
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(24.0),
                ),
                onTap: loading ? null : onPressed,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.kblueGradientAppBar,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: loading
                        ? Container(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Continuar".toUpperCase(),
                                style: AppTextStyles.kForwadSignUpButton,
                              ),
                              const SizedBox(width: 12.0),
                              const SizedBox(width: 0.0),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
