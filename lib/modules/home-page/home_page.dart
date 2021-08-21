import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:raro_academy_budget/modules/home-page/widgets/card_day_by_day.dart';
import 'package:raro_academy_budget/modules/home-page/widgets/card_general_balance.dart';
import 'package:raro_academy_budget/modules/home-page/widgets/card_last_transactions.dart';
import 'package:raro_academy_budget/shared/repositories/transaction_repository.dart';
import 'package:raro_academy_budget/shared/services/user_manager.dart';
import 'package:raro_academy_budget/shared/widgets/drawer_widget.dart';
import 'package:raro_academy_budget/shared/widgets/next_button_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/extensions.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserManager userManager = GetIt.I<UserManager>();
  late StreamSubscription sub;
  final controller = HomeController();
  
  @override
  void initState() {
    controller.checkInternet();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          toolbarHeight: size.height * 0.12625,
          centerTitle: true,
          title: Text("Olá, " + userManager.user!.name.split(" ")[0],
              style: AppTextStyles.kAppBarName),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.kblueGradientAppBar,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Observer(builder:(_){
                if(controller.appStatus == AppStatus.loading){
                  return Center(child: CircularProgressIndicator());
                } else if(controller.isInternet == true){
                   return Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: CardGeneralBalance(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: CardDaybyDay(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: LastTransactions(),
                      ),
                    ],
                  );   
                } else if(controller.isInternet == false){
                  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.25),
                    const Center(
                        child: Text(
                      "Erro na\nconexão",
                      style: AppTextStyles.kNoConnection,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: NextButtonWidget(
                        onTap: () {
                         
                          controller.checkInternet();
                          
                        },
                        buttonText: "Tentar Novamente",
                      ),
                    ),
                  ],
                  );
                } return Container();
              }  
              )
            
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: 
            Observer(builder:(_) {
              if(controller.isInternet == true){
                return NextButtonWidget(
                  onTap: () { },
                  prefixIcon: Icons.add,
                  buttonText: "Novo Controle",
                );
              }  else {
                 return Container();
               }
            }
            
      ),
    ),);
  }
}
