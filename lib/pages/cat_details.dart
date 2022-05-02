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
        // backgroundColor: Color(0xFFFFC670),
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
            Color.fromARGB(220, 91, 25, 2),
            Color.fromARGB(220, 255, 111, 0),
            Color.fromARGB(220, 245, 182, 140)
          ])),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                image: (catBreed.referenceImageId is String)
                    ? DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(catBreed.id == 'beng' ||
                                catBreed.id == 'kora' ||
                                catBreed.id == 'drex'
                            ? "https://cdn2.thecatapi.com/images/${catBreed.referenceImageId?.replaceAll('\n', '')}.png"
                            : "https://cdn2.thecatapi.com/images/${catBreed.referenceImageId?.replaceAll('\n', '')}.jpg"))
                    : const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/pusheen.gif"))
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.2),
                )
              ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 50.0,
                      sigmaY: 50.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // width: 360,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 2.0,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: Scrollbar(
                        isAlwaysShown: false,scrollbarOrientation: ScrollbarOrientation.left,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                catBreed.name ?? "",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.josefinSans().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                catBreed.description ?? "",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.mulish().fontFamily,
                                    fontSize: 18,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
          const SizedBox(
            height: 16,
          ),
          Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.2),
                )
              ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 50.0,
                      sigmaY: 50.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // width: 360,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(FontAwesomeIcons.shieldCat,
                                    color: Colors.white),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Temperament: ",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.mulish().fontFamily,
                                      fontSize: 20,
                                      color: Colors.white,
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
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.mulish().fontFamily,
                                    fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
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
      ),
    ));
  }
}
