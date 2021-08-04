import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 107,
            width: 308,
            decoration: BoxDecoration(
              gradient: AppColors.kblueGradientAppBar,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, top: 45),
              child: Text("Olá, José", style: AppTextStyles.kAppBarName),
            ),
          ),
          Container(
            width: 308,
            padding: EdgeInsets.only(left: 27, top: 14, bottom: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perfil',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.15,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastro',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.87),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 0.15),
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Color.fromRGBO(224, 224, 224, 1),
          ),
          Container(
            width: 308,
            padding: EdgeInsets.only(left: 27, top: 14, bottom: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Conta',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.15,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Gerenciar cartões',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.87),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 0.15),
                    )),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Investimentos',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.87),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 0.15),
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Color.fromRGBO(224, 224, 224, 1),
          ),
          Container(
            width: 308,
            padding: EdgeInsets.only(left: 27, top: 14, bottom: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Segurança',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.54),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.15,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Alterar Senha',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.87),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 0.15),
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Color.fromRGBO(224, 224, 224, 1),
          ),
        ],
      ),
    );
  }
}
