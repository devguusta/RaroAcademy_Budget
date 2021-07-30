import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home';
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            drawer: Drawer(

            ),
          appBar: PreferredSize(
            child: Container(
              padding: EdgeInsets.only(top:50),
              // child: Text("Olá,name"),
              decoration: BoxDecoration(gradient:  AppColors.kblueGradientAppBar),
            ),
            preferredSize: Size.fromHeight(100)
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 96,
                    width: 330,
                  
                    decoration:  BoxDecoration(
                      boxShadow:  [
                        BoxShadow(
                          color: Color.fromRGBO(0,0, 0, 0.12 ),
                          // spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0,1),
                        ), 
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0,0.14),
                          offset: Offset(0,3),
                          blurRadius:1,
                        ),
                      ],
                      color: Color.fromRGBO(253,253,253,1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16, top:16,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Saldo geral", style: AppTextStyles.kTitleHomeMedium),
                              Icon(Icons.visibility, color: Color.fromRGBO(52,48,144,1)),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, bottom: 16,),
                            child: Text("R\$ 3.000,00", style: AppTextStyles.kSubTitleHomeMedium),
                          ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        
      ),
    );
  }
}