import 'package:flutter/material.dart';

class SignUpUseTerms extends StatefulWidget {
  const SignUpUseTerms({Key? key}) : super(key: key);

  @override
  _SignUpUseTermsState createState() => _SignUpUseTermsState();
}

class _SignUpUseTermsState extends State<SignUpUseTerms> {
  SingingCharacter? _character = SingingCharacter.no;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27.0, right: 22.0),
      child: Column(children: [
        const Text(
          'Lorem Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nque porro  est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            letterSpacing: 0.15,
            color: Color.fromRGBO(0, 0, 0, 0.54),
          ),
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Radio<SingingCharacter>(
                value: SingingCharacter.no,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() => _character = value);
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: const Text(
                'Eu li e aceito os termos e condições e a Política de privacidade do budget.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  letterSpacing: 0.15,
                  color: Color.fromRGBO(0, 0, 0, 0.54),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

enum SingingCharacter { yes, no }
