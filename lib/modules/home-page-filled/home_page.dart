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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
         title: Text("Olá,José", style: AppTextStyles.kAppBarName),
         flexibleSpace: Container(
           
           decoration: BoxDecoration(
             gradient: AppColors.kblueGradientAppBar,
           ),
           
         ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
             Padding(
               padding: const EdgeInsets.only(top:16),
               child: NextButtonWidget(
                 onTap: (){},
                 prefixIcon: Icons.add,
                 buttonText: "Novo Controle",
               ),
             ),
             
            ],
          ),
        ),
      ),
    );
  }
}





