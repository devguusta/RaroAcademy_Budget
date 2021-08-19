import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/registry-edit-page/widgets/header_widget.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_shadows.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class RegistryEditPage extends StatefulWidget {
  static const String id = '/in';
  const RegistryEditPage({Key? key}) : super(key: key);
  @override
  _RegistryEditPageState createState() => _RegistryEditPageState();
}

class _RegistryEditPageState extends State<RegistryEditPage> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  final UserManager userManager = GetIt.I<UserManager>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();
  String nameEditing = '';
  String phoneEditing = '';
  String cpfEditing = '';

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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
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
                child: Form(
                  key: form,
                  child: Column(
                    children: [
                      InputForm(
                        hintText: "Nome",
                        labelText: "Nome",
                        controller: name,
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
                        controller: cpf,
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
                        controller: phone,
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
            Positioned(
              bottom: 20.0,
              right: MediaQuery.of(context).size.width / 3.8,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(24.0),
                ),
                onTap: () async {
                  if (form.currentState!.validate()) {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userManager.user!.uid)
                        .update({
                      'name': name.text,
                      'phone': phone.text,
                      'cpf': cpf.text,
                    });
                    userManager.setUser(
                      userManager.user!.copyWith(name: name.text),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.kBlueGradient,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      'Salvar alterações'.toUpperCase(),
                      style: AppTextStyles.kSaveData,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
