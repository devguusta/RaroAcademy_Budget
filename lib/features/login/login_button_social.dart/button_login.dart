import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final IconData icon;
  const ButtonLogin({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(16),
      width: size.width * 0.9,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          primary: Color.fromRGBO(0,0,0,0.58),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Row(children: [
          
          Text(text, style: TextStyle(color: textColor, fontSize: 13, fontWeight: FontWeight.w500, fontFamily: "Roboto" ))
        ],),
      ),
    );
  }
}
