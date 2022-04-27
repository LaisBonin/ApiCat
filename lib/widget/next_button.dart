import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
        onPressed: (){},
        child: const Center(
          child:  Text("More Cats"),
            
        ),
      ),
    );
  }
}
