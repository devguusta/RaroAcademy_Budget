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
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: Header(),
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 35),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                    color: const Color(0xFFFDFDFD),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.12),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.14),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: -1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InputForm(
                        hintText: "Nome",
                        labelText: "Nome",
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InputForm(
                        hintText: "CPF",
                        labelText: "CPF",
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InputForm(
                        hintText: "Email",
                        labelText: "Email",
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InputForm(
                        hintText: "Celular",
                        labelText: "Celular",
                      ),
                    ],
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
                    decoration: BoxDecoration(
                      color: Color.alphaBlend(Color.fromRGBO(0, 0, 0, 0.15),
                          Color.fromRGBO(255, 255, 255, 1)),
                      // gradient: AppColors.kblueGradientAppBar,
                      borderRadius: BorderRadius.all(
                        Radius.circular(24.0),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        'SALVAR ALTERAÇÕES',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.38),
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.46,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.kBlueGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 28,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
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
    );
  }
}
