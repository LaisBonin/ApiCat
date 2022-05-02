import 'dart:typed_data';
import 'dart:ui';
import 'package:api_cat/api/fact.dart';
import 'package:api_cat/api/image.dart';
import 'package:api_cat/pages/cat_list.dart';
import 'package:api_cat/widget/next_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatPage extends StatefulWidget {
  const CatPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  String catFact = " ";
  Uint8List catImage = Uint8List(0);

  void _getInfo() async {
    catFact = await getFact();
    catImage = await getImage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.bottomRight,
          //     end: Alignment.topLeft,
          //     colors: [
          //       Color.fromARGB(220, 91, 25, 2),
          //       Color.fromARGB(220, 255, 111, 0),
          //       Color.fromARGB(220, 245, 182, 140)
          //     ]),
          image: DecorationImage(
        opacity: 0.7,
        // colorFilter: ColorFilter.mode(
        //     Color.fromARGB(255, 194, 194, 193), BlendMode.dstATop),
        image: AssetImage("images/bordercat.png"),
        fit: BoxFit.fill,
      )),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 150,
            ),
            // Text(
            //   "Cat Curiosities",
            //   style: TextStyle(
            //     fontFamily: GoogleFonts.josefinSans().fontFamily,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 26,
            //   ),
            // ),
            FutureBuilder<Uint8List>(
                future: getImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.deepOrange,
                    );
                  }
                  if (snapshot.hasData && !snapshot.hasError) {
                    return ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100.0)),
                      child: Container(
                        height: 300,
                        width: 350,
                        // padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: MemoryImage(snapshot.data!))),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text("DEU RUIM");
                  }
                  return const CircularProgressIndicator();
                }),

            const SizedBox(
              height: 32,
            ),

            // catImage != null ? Image.memory(catImage!) : Icon(Icons.pets),
            FutureBuilder<String>(
                future: getFact(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }
                  if (snapshot.hasError) {
                    return const Text("deu erro");
                  }
                  if (snapshot.hasData && !snapshot.hasError) {
                    return Container(
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                margin:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                // width: 360,
                                height: 150,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                          Color.fromARGB(220, 91, 25, 2),
                                          Color.fromARGB(220, 255, 111, 0),
                                          Color.fromARGB(220, 245, 182, 140)
                                        ]),
                                    // color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      width: 1.5,
                                      color: Colors.white.withOpacity(0.2),
                                    )),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data!,
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.josefinSans()
                                              .fontFamily,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )));

                    // Container(
                    //   decoration: const BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(20)),
                    //     color: Colors.orange,
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(20),
                    //     child: Text(
                    //       snapshot.data!,
                    //       style: TextStyle(
                    //         fontFamily:
                    //             GoogleFonts.josefinSans().fontFamily,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 20,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // );
                  }
                  return const Text("ALGO DEU ERRADO");
                }),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NextButton(
                  text: "More Cats",
                  action: () {
                    _getInfo();
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                NextButton(
                  text: "Bônus",
                  action: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CatList()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
  

}
