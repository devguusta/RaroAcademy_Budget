import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:raro_academy_budget/modules/home-page/home_controller.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/widgets/visible_widget.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class CardGeneralBalance extends StatefulWidget {
  const CardGeneralBalance({
    Key? key,
  }) : super(key: key);

  @override
  _CardGeneralBalanceState createState() => _CardGeneralBalanceState();
}

class _CardGeneralBalanceState extends State<CardGeneralBalance> {
  TransactionController controller = TransactionController();
  final manager = HomeController();
  double totalValueOut = 0;
  double totalValueIn = 0;
  double totalValue = 0.0;
  var list;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width * 0.9,
        decoration: BoxDecoration(
          boxShadow: const [
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
          color: const Color.fromRGBO(253, 253, 253, 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: StreamBuilder<Map<String, dynamic>?>(
            stream: controller.getBalance(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print(snapshot.connectionState);
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                        child: Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator()));
                    break;
                  case ConnectionState.active:
                    return Observer(builder: (_) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16,
                              top: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Saldo geral",
                                  style: AppTextStyles.kTitleHomeMedium,
                                ),
                                Observer(builder: (_) {
                                  return VisibleWidget(
                                    visible: manager.visible,
                                    onPressed: () {
                                      manager.changeVisible();
                                    },
                                  );
                                })
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                bottom: 16,
                              ),
                              child: manager.visible
                                  ? Container()
                                  : Text(
                                      "R\$ 0.00",
                                      style: AppTextStyles.kSubTitleHomeMedium,
                                    ),
                            ),
                          ),
                        ],
                      );
                    });
                  default:
                    Container();
                }
                return Center(
                    child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return Text("Erro ao buscar os dados");
              } else if (snapshot.hasData) {
                return Observer(builder: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16,
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Saldo geral",
                              style: AppTextStyles.kTitleHomeMedium,
                            ),
                            Observer(builder: (_) {
                              return VisibleWidget(
                                visible: manager.visible,
                                onPressed: () {
                                  manager.changeVisible();
                                },
                              );
                            })
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            bottom: 16,
                          ),
                          child: manager.visible
                              ? Container()
                              : Text(
                                  "R\$ ${snapshot.data!['general_balance'].toStringAsFixed(2).replaceAll(".", ",")}",
                                  style: AppTextStyles.kSubTitleHomeMedium,
                                ),
                        ),
                      ),
                    ],
                  );
                });
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
