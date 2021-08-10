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
  String dropdownValue = 'Agosto';
  final pageController = PageController(initialPage: 0);
  var inTextStyle =
      AppTextStyles.kInputTextMedium.copyWith(color: Colors.white);
  var outTextStyle = AppTextStyles.kInputTextMedium
      .copyWith(color: Color.fromRGBO(255, 255, 255, 0.6));
  var allTextStyle = AppTextStyles.kInputTextMedium
      .copyWith(color: Color.fromRGBO(255, 255, 255, 0.6));
  @override
  Widget build(BuildContext ctx) {
    Size size = MediaQuery.of(context).size;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer()),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    height: 26,
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    child: DropdownButton<String>(
                      menuMaxHeight: size.height * 0.3,
                      elevation: 8,
                      dropdownColor: AppColors.kPurple,
                      value: dropdownValue,
                      underline: Container(
                        height: 0,
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.expand_more_outlined,
                            color: Colors.white),
                      ),
                      iconSize: 18,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Janeiro',
                        'Fevereiro',
                        'Março',
                        'Abril',
                        'Maio',
                        'Junho',
                        'Julho',
                        'Agosto',
                        'Setembro',
                        'Outubro',
                        'Novembro',
                        'Dezembro',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.kNextButtonMedium,
                          ),
                        );
                      }).toList(),
                    ),
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
                    InkWell(
                      onTap: () {
                        pageController.jumpToPage(0);
                      },
                      child: Text(
                        "Entradas",
                        style: inTextStyle,
                      ),
                    ),
                    Container(
                      height: 20,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pageController.jumpToPage(1);
                      },
                      child: Text(
                        "Saídas",
                        style: outTextStyle,
                      ),
                    ),
                    Container(
                      height: 20,
                      child: VerticalDivider(
                        thickness: 1,
                        // width: 2,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pageController.jumpToPage(2);
                      },
                      child: Text(
                        "Todos",
                        style: allTextStyle,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          TransactionsCardWidget(
            context: context,
            type: 0,
          ),
          TransactionsCardWidget(
            context: context,
            type: 1,
          ),
          TransactionsCardWidget(
            context: context,
            type: 2,
          ),
        ],
        onPageChanged: (num) {
          if (num == 0) {
            inTextStyle = inTextStyle.copyWith(color: Colors.white);
            outTextStyle = outTextStyle.copyWith(
                color: Color.fromRGBO(255, 255, 255, 0.6));
            allTextStyle = allTextStyle.copyWith(
                color: Color.fromRGBO(255, 255, 255, 0.6));
          } else if (num == 1) {
            inTextStyle =
                inTextStyle.copyWith(color: Color.fromRGBO(255, 255, 255, 0.6));
            outTextStyle = outTextStyle.copyWith(color: Colors.white);
            allTextStyle = allTextStyle.copyWith(
                color: Color.fromRGBO(255, 255, 255, 0.6));
          } else {
            inTextStyle =
                inTextStyle.copyWith(color: Color.fromRGBO(255, 255, 255, 0.6));
            outTextStyle = outTextStyle.copyWith(
                color: Color.fromRGBO(255, 255, 255, 0.6));
            allTextStyle = allTextStyle.copyWith(color: Colors.white);
          }
          setState(() {});
        },
      ),
    );
  }
}
class TransactionsCardWidget extends StatelessWidget {
  const TransactionsCardWidget(
      {Key? key, required this.context, required this.type})
      : super(key: key);
  final BuildContext context;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
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
                            type == 0
                                ? "Total entradas"
                                : type == 1
                                    ? "Total saídas"
                                    : "Total",
                            style: AppTextStyles.kInputTextMedium.copyWith(
                                color: Color.fromRGBO(52, 48, 144, 1)),
                          ),
                          Text(
                            "-R\$ 250,00",
                            style: AppTextStyles.kSubtitle3Medium.copyWith(
                                color: type == 0
                                    ? Color.fromRGBO(88, 179, 104, 1)
                                    : Color.fromRGBO(244, 67, 54, 1)),
                          )
                        ],
                      )))
            ],
          )),
      Visibility(
        visible: type == 2 ? false : true,
        child: Positioned(
            // bottom: 34,
            bottom: 26,
            left: (MediaQuery.of(context).size.width - 32) / 2,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: AppColors.kBlueGradient, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )),
      )
    ]);
  }
}