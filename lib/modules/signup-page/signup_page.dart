import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-footer/signup_footer.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-header/signup_header.dart';

class SignUpPage extends StatefulWidget {
  static const String id = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Expanded(child: SignUpHeader()),
          Expanded(
            child: Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 22.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: SignUpFooter(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
