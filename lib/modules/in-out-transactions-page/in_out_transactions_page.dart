import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/drawer_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

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
          child: SafeArea(
            child: Container(
              decoration:
                  BoxDecoration(gradient: AppColors.kblueGradientAppBar),
              child: Column(
                children: [
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
