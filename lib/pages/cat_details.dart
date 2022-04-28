import 'package:flutter/material.dart';
import 'package:api_cat/api/breeds.dart';

class CatDetails extends StatelessWidget {
  final Breeds catBreed;

  const CatDetails({Key? key, required this.catBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: NetworkImage(catBreed.image2!),
        //     ),
        //   ),
        // ),
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
