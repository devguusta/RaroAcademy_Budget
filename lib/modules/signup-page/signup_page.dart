import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/page_view_for.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/page_view_onboarding.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/page_view_one.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/page_view_two.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-footer/signup_footer.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/signup_use_terms.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_manager.dart';
import 'package:raro_academy_budget/shared/controllers/login_controller.dart';

class SignUpPage extends StatefulWidget {
  static const String id = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  createState() => _SignUpPageState();
}

enum SingingCharacter { yes, no }

class _SignUpPageState extends State<SignUpPage> {
  PageController pageController = PageController();
  final controller = SignUpManager();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  SingingCharacter? character = SingingCharacter.no;
  bool stateRadio = true;
  int pageChanged = 0;
  @override
  
  initState() {
   
    super.initState();
  }

  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cpfController.dispose();
    _phoneController.dispose();
    _confirmpasswordController.dispose();
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: size.height,
                  child: Observer(builder:(_){
                    return PageView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      pageSnapping: true,
                      onPageChanged: (index) {
                        controller.pageChanged = index;          
                      },
                      controller: controller.pageController,
                      children: [
                        Stack(
                          children: [
                            PageViewOne(
                              nameController: _nameController,
                              emailController: _emailController,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SignUpFooter(
                                page: '1',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                   controller.nextPage();
                                  }
                                },
                                onBack: () {
                                  Navigator.pushNamed(
                                    context,
                                    InitialLoginPage.id,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            PageViewTwo(
                              phoneController: _phoneController,
                              cpfController: _cpfController,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SignUpFooter(
                                page: '2',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                   controller.nextPage();
                                    
                                  }
                                },
                                onBack: () {
                                  controller.backPage();
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            SignUpUseTerms(
                              state: stateRadio,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SignUpFooter(
                                page: '3',
                                onPressed: () {
                                  if (stateRadio == true) {
                                   controller.nextPage();
                                  
                                  }
                                },
                                onBack: () {
                                 controller.backPage();
                                },
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            PageViewFor(
                              passwordController: _passwordController,
                              confirmPasswordController:
                                  _confirmpasswordController,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SignUpFooter(
                                loading: controller.loading,
                                page: '4',
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                   
                                    controller.changeTrueLoading();
                                    };
                                   
                                    try {
                                      bool result = await LoginController()
                                          .createAccount(
                                              email: _emailController.text,
                                              password: _passwordController.text,
                                              name: _nameController.text,
                                              phone: _phoneController.text,
                                              cpf: _cpfController.text);
                  
                                      if (result) {
                                       controller.changeFalseLoading();
                                      
                                       controller.nextPage();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Erro ao cadastrar, verifique sua conexão e tente novamente",
                                            ),
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Erro ao cadastrar, verifique sua conexão e tente novamente",
                                          ),
                                        ),
                                      );
                                    }
                                    controller.changeFalseLoading();
                                   
                                  },
                                onBack: () {
                                controller.backPage();
                                },
                              ),
                            ),
                          ],
                        ),
                        const OnBoarding(),
                      ],
                    );
                  })
                    
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
