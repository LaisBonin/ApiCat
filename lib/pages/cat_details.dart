import 'package:flutter/material.dart';
import 'package:api_cat/api/breeds.dart';

class CatDetails extends StatelessWidget {
  final Breeds catBreed;

  const CatDetails({Key? key, required this.catBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg"),
            ),
          ),
        ),
        Text(catBreed.name ?? ""),
        const SizedBox(
          height: 16,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(catBreed.description ?? ""),
        ),
      ]),
    );
  }
}
