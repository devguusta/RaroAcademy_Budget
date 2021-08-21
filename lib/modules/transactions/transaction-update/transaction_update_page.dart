import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:raro_academy_budget/modules/transactions/transaction-in-page/widgets/transaction_in_input_widget.dart';
import 'package:raro_academy_budget/modules/transactions/transaction_controller.dart';
import 'package:raro_academy_budget/modules/transactions/widgets/transaction_date_widget.dart';
import 'package:raro_academy_budget/shared/controllers/transaction_controller.dart';
import 'package:raro_academy_budget/shared/models/transaction_model.dart';
import 'package:raro_academy_budget/shared/widgets/button_widget.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_item_widget.dart';
import 'package:raro_academy_budget/shared/widgets/dropdown_widget.dart';
import 'package:raro_academy_budget/shared/widgets/transaction_page_widget.dart';
import 'package:raro_academy_budget/util/constants/app_colors.dart';
import 'package:raro_academy_budget/util/constants/app_icons.dart';

class UpdatePage extends StatefulWidget {
  static const String id = '/update';

  const UpdatePage({
    Key? key,
  }) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  DropDownMenuItem? _value;
  TextEditingController _amountValue = TextEditingController();
  TextEditingController _amountDescription = TextEditingController();
  DateTime? _dateTime;
  final controller = TransactionManager();

  @override
  Widget build(BuildContext context) {
    final transctioModel =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;

    _amountValue.text = transctioModel.value.toString();
    if (transctioModel.type == "in") {
      _amountDescription.text = transctioModel.description!;
    }
    controller.changeDateTime(transctioModel.date);
    // _dateTime = transctioModel.date;

    List<DropDownMenuItem> inItems = [
      const DropDownMenuItem(
        category: 'Pix',
        icon: AppIcons.kPix,
        color: AppColors.kPurple,
      ),
      const DropDownMenuItem(
        category: 'Dinheiro',
        icon: AppIcons.kMoney,
        color: AppColors.kPurple,
      ),
      const DropDownMenuItem(
        category: 'Doc',
        icon: AppIcons.kDoc,
        color: AppColors.kPurple,
      ),
      const DropDownMenuItem(
        category: 'Ted',
        icon: AppIcons.kTed,
        color: AppColors.kPurple,
      ),
      const DropDownMenuItem(
        category: 'Boleto',
        icon: AppIcons.kBoleto,
        color: AppColors.kPurple,
      ),
    ];

    List<DropDownMenuItem> outItems = [
      const DropDownMenuItem(
        category: 'Refeição',
        icon: AppIcons.kMeal,
        color: AppColors.kYellow,
      ),
      const DropDownMenuItem(
        category: 'Transporte',
        icon: AppIcons.kTransport,
        color: AppColors.kGreen,
      ),
      const DropDownMenuItem(
        category: 'Viagem',
        icon: AppIcons.kTravel,
        color: AppColors.kPink,
      ),
      const DropDownMenuItem(
        category: 'Educação',
        icon: AppIcons.kEducation,
        color: AppColors.kCyan,
      ),
      const DropDownMenuItem(
        category: 'Pagamentos',
        icon: AppIcons.kPayments,
        color: AppColors.kPurple,
      ),
      const DropDownMenuItem(
        category: 'Outros',
        icon: AppIcons.kOthers,
        color: AppColors.kLilac,
      ),
    ];

    _value = transctioModel.type == "in"
        ? inItems.firstWhere(
            (element) => element.category == transctioModel.category)
        : outItems.firstWhere(
            (element) => element.category == transctioModel.category);

    return Observer(
      builder: (_){
        return TransactionPageWidget(
        pageTitle: transctioModel.type == "in" ? "Entrada" : "Saída",
        button: ButtonWidget(
          buttonIcon: Icons.autorenew,
          buttonText: 'Atualizar',
          onTap: () {
            TransactionController().updateTransaction(
              transaction: TransactionModel(
                value: double.parse(_amountValue.text),
                type: transctioModel.type,
                category: _value!.category,
                description:
                    transctioModel.type == "in" ? _amountDescription.text : null,
                userId: transctioModel.userId!,
                date: controller.dateTime!,
                transactionId: transctioModel.transactionId!,
              ),
            );
            Navigator.pop(context);
          },
        ),
        children: [
          TransactionInInputWidget(
            hintText: "Valor em R\$",
            labelText: "Valor em R\$",
            controller: _amountValue,
          ),
          DropdownWidget(
            value: _value,
            labelText: "Tipo de Entrada",
            selectedItemBuilder: (_) => transctioModel.type == "in"
                ? inItems.map((DropDownMenuItem item) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.category,
                      ),
                    );
                  }).toList()
                : outItems.map((DropDownMenuItem item) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.category,
                      ),
                    );
                  }).toList(),
            items: transctioModel.type == "in"
                ? inItems.map((DropDownMenuItem item) {
                    return DropdownMenuItem(
                        value: item,
                        child: DropDownMenuItem(
                          category: item.category,
                          icon: item.icon,
                          color: item.color,
                        ));
                  }).toList()
                : outItems.map((DropDownMenuItem item) {
                    return DropdownMenuItem(
                        value: item,
                        child: DropDownMenuItem(
                          category: item.category,
                          icon: item.icon,
                          color: item.color,
                        ));
                  }).toList(),
            onChanged: (DropDownMenuItem? value) {
              _value = value!;
              print(_value!.category);
            },
          ),
          TransactionDateWidget(
            date: DateFormat("dd/MM/yyyy").format(controller.dateTime!),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: controller.dateTime!,
                firstDate: DateTime(2020),
                lastDate: DateTime(2022),
              ).then((date) {
                //TODO: falta atualizar na tela
                controller.changeDateTime(date!);
                print(controller.dateTime);
              });
            },
          ),
          transctioModel.type == "in"
              ? TransactionInInputWidget(
                  hintText: " ",
                  labelText: "Nome da Entrada",
                  controller: _amountDescription,
                  keyboardType: TextInputType.text,
                  inputFormat: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-ZzáàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ]+|\s')),
                )
              : Container(),
        ],
      );
      }
    );
  }
}
