import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:raro_academy_budget/modules/home-page/home_page.dart';
import 'package:raro_academy_budget/modules/login-page/login_manager.dart';
import 'package:raro_academy_budget/shared/controllers/login_controller.dart';
import 'package:raro_academy_budget/shared/models/user_model.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/shared/widgets/visible_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_images.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class PasswordPage extends StatefulWidget {
  static const String id = '/password';
  final String email;
  PasswordPage({Key? key, required this.email}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController passwordController = TextEditingController();
  final controller = LoginManager();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  duration: const Duration(milliseconds: 400),
                  child: Image.asset(AppImages.logoBudget),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 48.0, top: 16),
              child: Text(
                "Insira sua senha",
                style: AppTextStyles.kPrimaryTextLoginPage,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            Form(
              key: _formKey,
              child: Observer(builder: (_){
                return Column(
                  children: [
                    InputForm(
                      hintText: "Insira seu e-mail",
                      labelText: "E-mail",
                      initialValue: widget.email,
                      enabled: false,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: (){
                        FocusScope.of(context).nextFocus();
                      },
                      
                    ),
                    const SizedBox(height: 50.0),
                    InputForm(
                      hintText: 'Senha',
                      labelText: 'Senha',
                      controller: passwordController,
                      obscureText: !controller.passwordVisible,
                      suffixIcon: VisibleWidget(
                      visible: !controller.passwordVisible, 
                      onPressed: (){
                       controller.changePasswordVisible();
                          
                        }),
                      // onChanged: (value) {},
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'A senha deve ter no mínimo 6 caracteres';
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                  ],
                );      
              })
              
             
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Recuperar senha".toUpperCase(),
                        style: AppTextStyles.kRecoverPassword,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          try {
                            print(widget.email);
                            print(passwordController.text);
                            UserModel? userModel = await LoginController()
                                .login(
                                    email: widget.email,
                                    password: passwordController.text);

                            if (userModel != null) {
                              Navigator.pushReplacementNamed(
                                context,
                                HomePage.id,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Erro ao logar user!")));
                            }
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Erro ao logar!")));
                          }

                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36.0,
                        width: 114.0,
                        decoration: const BoxDecoration(
                          gradient: AppColors.kblueGradientAppBar,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                        ),
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
                            : Text(
                                "Continuar".toUpperCase(),
                                style: AppTextStyles.kContinuePassword,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
