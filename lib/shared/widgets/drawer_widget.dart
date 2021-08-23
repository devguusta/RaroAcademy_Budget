import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/modules/login/initial_login_page.dart';
import 'package:raro_academy_budget/modules/registry-edit/registry_edit_page.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final UserManager userManager = GetIt.I<UserManager>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 107,
            width: 308,
            decoration: const BoxDecoration(
              gradient: AppColors.kblueGradientAppBar,
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 45),
                child: Observer(
                  builder: (_) => Text(
                      "Olá, " + userManager.user!.name.split(" ")[0],
                      style: AppTextStyles.kAppBarName),
                )),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Wrap(
                children: [
                  Container(
                    width: 308,
                    padding: const EdgeInsets.only(
                      left: 27,
                      top: 14,
                      bottom: 21,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Perfil',
                          style: AppTextStyles.kLabelItemDrawer,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegistryEditPage(),
                              ),
                            );
                          },
                          child: const Text('Cadastro',
                              style: AppTextStyles.kInputTextMedium),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color.fromRGBO(224, 224, 224, 1),
                  ),
                  Container(
                    width: 308,
                    padding: const EdgeInsets.only(
                      left: 27,
                      top: 14,
                      bottom: 21,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Conta',
                          style: AppTextStyles.kLabelItemDrawer,
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Gerenciar cartões',
                            style: AppTextStyles.kInputTextMedium,
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Investimentos',
                            style: AppTextStyles.kInputTextMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color.fromRGBO(224, 224, 224, 1),
                  ),
                  Container(
                    width: 308,
                    padding: const EdgeInsets.only(
                      left: 27,
                      top: 14,
                      bottom: 21,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Segurança',
                          style: AppTextStyles.kLabelItemDrawer,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Alterar Senha',
                            style: AppTextStyles.kInputTextMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color.fromRGBO(224, 224, 224, 1),
                  ),
                  Container(
                    width: 308,
                    padding: const EdgeInsets.only(
                      left: 27,
                      top: 14,
                      bottom: 21,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Ajuda',
                            style: AppTextStyles.kInputTextMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  const Divider(thickness: 1),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: InkWell(
                        onTap: () async {
                          SharedPreferences _prefs =
                              await SharedPreferences.getInstance();
                          // Navigator.of(context).pop();

                          _prefs.remove('user');
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const InitialLoginPage()),
                              (route) => false);
                          //GetIt.I<UserManager>().setUser(null);
                        },
                        child: const Text(
                          'Sair',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: 0.15,
                            color: Color.fromRGBO(58, 91, 150, 1),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
