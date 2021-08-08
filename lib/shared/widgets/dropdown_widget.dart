import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

import 'dropdown_item_widget.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    this.value,
    this.labelText,
    this.selectedItemBuilder,
    this.onChanged,
    this.items,
  });

  final DropDownMenuItem? value;
  final String? labelText;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Function(DropDownMenuItem?)? onChanged;
  final List<DropdownMenuItem<DropDownMenuItem>>? items;

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    print("widget atualizado");
    return DropdownButtonFormField(
      value: widget.value,
      decoration: InputDecoration(
        hintText: "Escolha",
        labelText: widget.labelText,
        labelStyle: AppTextStyles.kInputLabel,
      ),
      isExpanded: true,
      selectedItemBuilder: widget.selectedItemBuilder,
      items: widget.items,
      onChanged: widget.onChanged,
    );
  }
}
