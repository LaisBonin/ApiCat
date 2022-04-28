import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:api_cat/api/breeds.dart';
import 'package:google_fonts/google_fonts.dart';

class CatDetails extends StatelessWidget {
  final Breeds catBreed;

  const CatDetails({Key? key, required this.catBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 198, 112),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg"),
                ),
              ),
            ),
            Text(
              catBreed.name ?? "",
              style: TextStyle(
                fontFamily: GoogleFonts.josefinSans().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                catBreed.description ?? "",
                style: TextStyle(
                    fontFamily: GoogleFonts.mulish().fontFamily, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              margin: EdgeInsets.fromLTRB(120, 0, 120, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Adaptability: ",
                      style: TextStyle(
                          fontFamily: GoogleFonts.mulish().fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("${catBreed.adaptability.toString()},"),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
