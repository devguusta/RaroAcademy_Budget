import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/registry-edit-page/registry_edit_page.dart';
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
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Wrap(
                  children: [
                    Container(
                      width: 308,
                      padding: EdgeInsets.only(left: 27, top: 14, bottom: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Perfil', style: AppTextStyles.kLabelItemDrawer),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegistryEditPage()));
                              },
                              child: Text('Cadastro',
                                  style: AppTextStyles.kInputTextMedium))
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Color.fromRGBO(224, 224, 224, 1),
                    ),
                    Container(
                      width: 308,
                      padding: EdgeInsets.only(left: 27, top: 14, bottom: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Conta', style: AppTextStyles.kLabelItemDrawer),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text('Gerenciar cartões',
                                  style: AppTextStyles.kInputTextMedium)),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text('Investimentos',
                                  style: AppTextStyles.kInputTextMedium))
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
                          Text('Segurança',
                              style: AppTextStyles.kLabelItemDrawer),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text('Alterar Senha',
                                  style: AppTextStyles.kInputTextMedium))
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
                          InkWell(
                              onTap: () {},
                              child: Text('Ajuda',
                                  style: AppTextStyles.kInputTextMedium))
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Divider(
                      thickness: 1,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 14),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Sair',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: 0.15,
                                color: Color.fromRGBO(58, 91, 150, 1)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}