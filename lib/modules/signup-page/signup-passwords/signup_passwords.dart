import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-form/signup_form.dart';
import 'package:raro_academy_budget/shared/widgets/my_bullet.dart';

class SignUpPasswords extends StatefulWidget {
  const SignUpPasswords({Key? key}) : super(key: key);

  @override
  _SignUpPasswordsState createState() => _SignUpPasswordsState();
}

class _SignUpPasswordsState extends State<SignUpPasswords> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                  child: MyBullet(),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: const Text(
                    'pelo menos oito caracteres',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                  child: MyBullet(),
                ),
                const SizedBox(width: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: const Text(
                    'letras maiúsculas, letras minúsculas, números e símbolos',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50.0),
          const SignUpFormPassword(),
          const SizedBox(height: 50.0),
          const SignUpFormRepeatPassword(),
        ],
      ),
    );
  }
}
