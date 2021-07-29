import 'package:flutter/material.dart';

class VisibleWidget extends StatelessWidget {
  const VisibleWidget({
    Key? key,
    required this.visible,
    required this.onPressed,
  }) : super(key: key);

  final bool visible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        visible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: const Color.fromRGBO(0, 0, 0, 58),
      ),
      onPressed: onPressed,
    );
  }
}
