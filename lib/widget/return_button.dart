import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_circle_left_rounded,
        size: 40,
        color: Color.fromARGB(220, 91, 25, 2),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
