import 'package:flutter/material.dart';
import 'package:api_cat/api/breeds.dart';

class CatDetails extends StatelessWidget {
  final Breeds catBreed;

  const CatDetails({Key? key, required this.catBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [Text(catBreed.name ?? "")],
        ),
        Row(
          children: [Text(catBreed.description ?? "")],
        ),
      ]),
    );
  }
}
