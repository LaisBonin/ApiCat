import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:api_cat/api/breeds.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CatDetails extends StatelessWidget {
  final Breeds catBreed;

  const CatDetails({Key? key, required this.catBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFC670),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.shieldCat),
                const SizedBox(width: 8,),
                Text(
                  "Temperament: ",
                  style: TextStyle(
                      fontFamily: GoogleFonts.mulish().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                catBreed.temperament ?? "",
                style: TextStyle(
                    fontFamily: GoogleFonts.mulish().fontFamily, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              margin: const EdgeInsets.fromLTRB(120, 0, 120, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFDAF5FF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Adaptability: ",
                    style: TextStyle(
                        fontFamily: GoogleFonts.mulish().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "${catBreed.adaptability.toString()}",
                    style: TextStyle(
                        fontFamily: GoogleFonts.mulish().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(120, 0, 120, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFDAF5FF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Affection: ",
                    style: TextStyle(
                        fontFamily: GoogleFonts.mulish().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "${catBreed.affectionLevel.toString()}",
                    style: TextStyle(
                        fontFamily: GoogleFonts.mulish().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(120, 0, 120, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFDAF5FF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Inteligence: ",
                    style: TextStyle(
                        fontFamily: GoogleFonts.mulish().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "${catBreed.intelligence.toString()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GoogleFonts.mulish().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
        ));
  }
}
