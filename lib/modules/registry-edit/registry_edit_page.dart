import 'package:flutter/material.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';

class RegistryEditPage extends StatefulWidget {
  static const String id = '/in';

  const RegistryEditPage({Key? key}) : super(key: key);

  @override
  _RegistryEditPageState createState() => _RegistryEditPageState();
}

class _RegistryEditPageState extends State<RegistryEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.kBlueGradient,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 28,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Cadastro",
                  style: TextStyle(
                    color: AppColors.kWhite,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  // decoration: BoxDecoration(gradient: AppColors.kwhiteGradient),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        color: Color(0xFFFDFDFD),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.12),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.14),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: -1,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InputForm(
                            hintText: "Nome",
                            labelText: "Nome",
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: InputForm(
                                  hintText: "CPF",
                                  labelText: "CPF",
                                ),
                              ),
                            ],
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: InputForm(
                                  hintText: "E-mail",
                                  labelText: "E-mail",
                                ),
                              ),
                            ],
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: InputForm(
                                  hintText: "Celular",
                                  labelText: "Celular",
                                ),
                              ),
                            ],
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 40.0),
                          //   child: TextButton(
                          //     child: Text(
                          //       DateFormat("dd/MM/yyyy").format(_dateTime),
                          //     ),
                          //     onPressed: () {
                          //       showDatePicker(
                          //               context: context,
                          //               initialDate: DateTime.now(),
                          //               firstDate: DateTime(2020),
                          //               lastDate: DateTime(2022))
                          //           .then((date) {
                          //         setState(() {
                          //           _dateTime = date!;
                          //         });
                          //       });
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20.0,
                    right: MediaQuery.of(context).size.width / 3.8,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24.0),
                      ),
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          // gradient: AppColors.kblueGradientAppBar,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text(
                            'SALVAR ALTERAÇÕES',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.38),
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                letterSpacing: 0.46),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
