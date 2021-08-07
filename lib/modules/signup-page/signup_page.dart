import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:raro_academy_budget/modules/signup-page/page-view/page-view_two.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/page_view_for.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/page_view_onboarding.dart';
import 'package:raro_academy_budget/modules/signup-page/page-view/page_view_one.dart';
import 'package:raro_academy_budget/modules/signup-page/signup-footer/signup_footer.dart';


import 'package:raro_academy_budget/modules/signup-page/page-view/signup_use_terms.dart';

class SignUpPage extends StatefulWidget {
  static const String id = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  createState() => _SignUpPageState();
}

enum SingingCharacter { yes, no }

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  PageController pageController = PageController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
 
  SingingCharacter? character = SingingCharacter.no;
  bool stateRadio = true;
  int pageChanged = 0;
  @override
  initState() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1,
    );
    super.initState();
  }

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
                child: Container(
                  height: size.height,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    pageSnapping: true,
                    onPageChanged: (index) {
                      setState(() {
                        pageChanged = index;
                      });
                    },
                    controller: pageController,
                    children: [
                      Stack(children: [
                        PageViewOne(
                            emailController: _emailController,
                            nameController: _nameController),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SignUpFooter(
                              page: '1',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  pageController.nextPage(
                                    duration: Duration(microseconds: 400),
                                    curve: Curves.easeIn,
                                  );
                                }
                              }),
                        ),
                      ]),
                      Stack(
                        children: [
                          PageViewTwo(
                              phoneController: _phoneController,
                              cpfController: _cpfController),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SignUpFooter(
                                page: '2',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    pageController.nextPage(
                                      duration: Duration(microseconds: 400),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                                onBack: () {
                                  pageController.previousPage(
                                      duration: Duration(microseconds: 400),
                                      curve: Curves.easeIn);
                                }),
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
                                    pageController.nextPage(
                                      duration: Duration(microseconds: 400),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                                onBack: () {
                                  pageController.previousPage(
                                      duration: Duration(microseconds: 400),
                                      curve: Curves.easeIn);
                                }),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          PageViewFor(
                              passwordController: _passwordController,
                              confirmPasswordController:
                                  _confirmpasswordController),
                                  Align(
                            alignment: Alignment.bottomCenter,
                            child: SignUpFooter(
                                page: '4',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    pageController.nextPage(
                                      duration: Duration(microseconds: 400),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                                onBack: () {
                                  pageController.previousPage(
                                      duration: Duration(microseconds: 400),
                                      curve: Curves.easeIn);
                                }),
                          ),
                        ],
                      ),
                      OnBoarding(),
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
