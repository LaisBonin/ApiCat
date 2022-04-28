import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function action;
  final String text;
  const NextButton({Key? key, required this.action, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 130,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
        onPressed: () => action(),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
