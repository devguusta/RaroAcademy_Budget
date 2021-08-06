import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/drawer_widget.dart';
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
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer()),
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
                            .copyWith(color: Colors.white),
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
                        style: AppTextStyles.kInputTextMedium.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.6)),
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
                        style: AppTextStyles.kInputTextMedium.copyWith(
                            color: Color.fromRGBO(255, 255, 255, 0.6)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
