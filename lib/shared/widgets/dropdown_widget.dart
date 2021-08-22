import 'package:flutter/material.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';

import 'dropdown_item_widget.dart';

class DropdownWidget extends StatelessWidget {
  final DropDownMenuItem? value;
  final String? labelText;
  final String? hintText;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Function(DropDownMenuItem?)? onChanged;
  final List<DropdownMenuItem<DropDownMenuItem>>? items;

  const DropdownWidget({
    this.value,
    this.labelText,
    this.hintText,
    this.selectedItemBuilder,
    this.onChanged,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: DropdownButtonFormField(
              autofocus: false,
              value: value,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                labelStyle: AppTextStyles.kInputLabel,
              ),
              isExpanded: true,
              selectedItemBuilder: selectedItemBuilder,
              items: items,
              onChanged: onChanged,
            ),
          ),
        )
      ],
    );
  }
}
