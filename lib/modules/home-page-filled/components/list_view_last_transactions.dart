import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

class ListViewLastTransactions extends StatefulWidget {
  
  const ListViewLastTransactions({
    Key? key,
   
  }) : super(key: key);

  @override
  _ListViewLastTransactionsState createState() => _ListViewLastTransactionsState();
}

class _ListViewLastTransactionsState extends State<ListViewLastTransactions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 2,
          itemBuilder: (_, index) => Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 180, 0, 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child:
                          Icon(Icons.fastfood, color: Colors.white),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0.0, bottom: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, left: 4),
                            child: Text("Refeição",
                                style: AppTextStyles
                                    .kTitleListLastTransictions),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("02/08/2021",
                                style: AppTextStyles
                                    .kDateLastTransictions),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Text("-R\$ 25,00",
                              style: AppTextStyles
                                  .kValueLastTransictions),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}