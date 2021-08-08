import 'package:flutter/material.dart';

class DropDownMenuItem extends StatelessWidget {
  final IconData? icon;
  final String category;
  final Color? color;

  const DropDownMenuItem({
    required this.category,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          width: 24.0,
          height: 24.0,
          child: Icon(icon, color: Colors.white, size: 14.0),
        ),
        SizedBox(width: 5.0),
        Text(category),
      ],
    );
  }
}
