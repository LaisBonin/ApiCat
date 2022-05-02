import 'package:api_cat/api/breeds.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatCard1 extends StatelessWidget {
  const CatCard1({Key? key, required this.catBreed}) : super(key: key);

  final Breeds catBreed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(120, 0, 120, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFDAF5FF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
      ],
    );
  }
}
