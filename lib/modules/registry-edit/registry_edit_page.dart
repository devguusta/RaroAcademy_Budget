import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/modules/registry-edit/widgets/header_widget.dart';
import 'package:raro_academy_budget/shared/controllers/login_controller.dart';
import 'package:raro_academy_budget/shared/models/user_model.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';
import 'package:raro_academy_budget/shared/widgets/button_widget.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_shadows.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistryEditPage extends StatefulWidget {
  static const String id = '/in';
  const RegistryEditPage({Key? key}) : super(key: key);
  @override
  _RegistryEditPageState createState() => _RegistryEditPageState();
}

class _RegistryEditPageState extends State<RegistryEditPage> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  final UserManager userManager = GetIt.I<UserManager>();

  String nameEditing = '';
  String phoneEditing = '';
  String cpfEditing = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    nameEditing = userManager.user!.name;
    phoneEditing = userManager.user!.phone;
    cpfEditing = userManager.user!.cpf;
    return Scaffold(
      appBar: PreferredSize(
        child: const Header(),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.symmetric(vertical: 35),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                color: const Color(0xFFFDFDFD),
                boxShadow: [
                  AppShadows.opacity012,
                  AppShadows.opacity014,
                  AppShadows.opacity020,
                ],
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: form,
                  child: Column(
                    children: [
                      InputForm(
                        hintText: "Nome",
                        labelText: "Nome",
                        initialValue: nameEditing,
                        enabled: !loading,
                        onSaved: (value) {
                          nameEditing = value ?? nameEditing;
                        },
                        // controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor preencher o campo vazio.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 22),
                      InputForm(
                        hintText: "CPF",
                        labelText: "CPF",
                        initialValue: cpfEditing,
                        enabled: !loading,
                        onSaved: (value) {
                          cpfEditing = value ?? cpfEditing;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor preencher o campo vazio.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 22),
                      InputForm(
                        enabled: false,
                        hintText: "Email",
                        labelText: "Email",
                        initialValue: userManager.user!.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor preencher o campo vazio.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 22),
                      InputForm(
                        hintText: "Celular",
                        labelText: "Celular",
                        enabled: !loading,
                        initialValue: phoneEditing,
                        onSaved: (value) {
                          phoneEditing = value ?? phoneEditing;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor preencher o campo vazio.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: MediaQuery.of(context).size.width / 3.8,
            child: ButtonWidget(
              onTap: () async {
                if (form.currentState!.validate()) {
                  form.currentState!.save();
                  setState(() {
                    loading = true;
                  });
                  SharedPreferences _prefs =
                      await SharedPreferences.getInstance();

                  UserModel newUser = userManager.user!.copyWith(
                      name: nameEditing, cpf: cpfEditing, phone: phoneEditing);

                  LoginController().updateUser(newUser);

                  userManager.setUser(newUser);
                  _prefs.setString("user", json.encode(newUser.toJson()));
                  setState(() {
                    loading = false;
                  });
                  Navigator.of(context).pop();
                }
              },
              buttonText: "Salvar Alterações",
              size: 0,
            ),
          )
        ],
      ),
    );
  }
}
