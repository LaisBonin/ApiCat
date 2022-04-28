import 'package:flutter/material.dart';
import 'package:api_cat/api/breeds.dart';

class CatDetails extends StatelessWidget {
  final Breeds catBreed;

  const CatDetails({Key? key, required this.catBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(catBreed.name ?? ""),
        SizedBox(
          height: 16,
        ),
        Text(catBreed.description ?? ""),
      ]),
    );
  }
}
