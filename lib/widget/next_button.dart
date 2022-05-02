import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Function action;
  final String text;
  const NextButton({Key? key, required this.action, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        
        borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color.fromARGB(255, 91, 25, 2),
                Color.fromARGB(255, 255, 111, 0),
                Color.fromARGB(255, 245, 182, 140)
              ]),),
      height: 40,
      width: 150,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Colors.white,
            shadowColor: Colors.transparent,
            elevation: 15,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )
            ),
        onPressed: () => action(),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
