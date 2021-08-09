import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/home-page-filled/components/card_day_by_day.dart';
import 'package:raro_academy_budget/modules/home-page-filled/components/card_general_balance.dart';
import 'package:raro_academy_budget/modules/home-page-filled/components/card_last_transactions.dart';
import 'package:raro_academy_budget/shared/widgets/next_button_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home';
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription sub;
  late bool isInternet = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      sub =  Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        isInternet = (result != ConnectivityResult.none);
      });
    });
    });

    super.initState();
  }

  // void checkInternet() async {
  //   if ((await Connectivity().checkConnectivity()) == ConnectivityResult.none) {
  //     isInternet = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          toolbarHeight: size.height * 0.12625,
          centerTitle: true,
          title: Text("Olá,José", style: AppTextStyles.kAppBarName),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppColors.kblueGradientAppBar,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: isInternet
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CardGeneralBalance(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CardDaybyDay(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LastTransactions(),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.25),
                    Center(
                        child: Text(
                      "Erro na\nconexão",
                      style: AppTextStyles.kNoConnection,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: NextButtonWidget(
                        onTap: () {},
                        buttonText: "Tentar Novamente",
                      ),
                    ),
                   
                  ],
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: isInternet
            ? NextButtonWidget(
                onTap: () {},
                prefixIcon: Icons.add,
                buttonText: "Novo Controle",
              )
            : Container(),
      ),
    );
  }
}
