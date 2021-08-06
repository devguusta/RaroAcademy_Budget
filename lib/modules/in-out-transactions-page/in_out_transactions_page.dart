import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/drawer_widget.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class InOutTransactionsPage extends StatefulWidget {
  const InOutTransactionsPage({Key? key}) : super(key: key);

  @override
  _InOutTransactionsPageState createState() => _InOutTransactionsPageState();
}

class _InOutTransactionsPageState extends State<InOutTransactionsPage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      drawer: DrawerWidget(),
      drawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(189),
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.kblueGradientAppBar),
          child: Column(
            children: [
              SizedBox(height: 49),
              Row(
                children: [
                  Builder(
                    builder: (context) => // Ensure Scaffold is in context
                        IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: () => Scaffold.of(context).openDrawer()),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 21,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 27, bottom: 11),
                child: Text(
                  'R\$ 1.104,53',
                  style: AppTextStyles.kTextTrasanctionHeader,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Entradas",
                      style: AppTextStyles.kInputTextMedium
                          .copyWith(color: Color.fromRGBO(255, 255, 255, 0.6)),
                    ),
                    Container(
                      height: 20,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Saídas",
                      style: AppTextStyles.kInputTextMedium
                          .copyWith(color: Colors.white),
                    ),
                    Container(
                      height: 20,
                      child: VerticalDivider(
                        thickness: 1,
                        // width: 2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Todos",
                      style: AppTextStyles.kInputTextMedium
                          .copyWith(color: Color.fromRGBO(255, 255, 255, 0.6)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 40),
              height: 395,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    // spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    offset: Offset(0, 3),
                    blurRadius: 1,
                  ),
                ],
                color: Color.fromRGBO(253, 253, 253, 1),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 10,
                        itemBuilder: (_, index) => Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TransactionWidget(),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total saídas",
                                style: AppTextStyles.kInputTextMedium.copyWith(
                                    color: Color.fromRGBO(52, 48, 144, 1)),
                              ),
                              Text(
                                "-R\$ 250,00",
                                style: AppTextStyles.kSubtitle3Medium.copyWith(
                                    color: Color.fromRGBO(244, 67, 54, 1)),
                              )
                            ],
                          )))
                ],
              )),
          Positioned(
              bottom: 16,
              left: 156,
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    gradient: AppColors.kBlueGradient, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
