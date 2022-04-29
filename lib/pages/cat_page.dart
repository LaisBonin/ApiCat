import 'dart:typed_data';
import 'package:api_cat/api/fact.dart';
import 'package:api_cat/api/image.dart';
import 'package:api_cat/pages/cat_list.dart';
import 'package:api_cat/widget/next_button.dart';
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
    return Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
            image: DecorationImage(
          opacity: 0.7,
          colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 194, 194, 193), BlendMode.dstATop),
          image: AssetImage("images/catborder.png"),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
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
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90)),
                          child: Image.memory(snapshot.data!),
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
                          decoration:const  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                           color: Colors.orange,

                          ),
                         
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              snapshot.data!,
                              style: TextStyle(
                                fontFamily:
                                    GoogleFonts.josefinSans().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      return const Text("ALGO DEU ERRADO");
                    }),
                const SizedBox(height: 30),
                NextButton(
                  text: "More Cats",
                  action: () {
                    _getInfo();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                NextButton(
                  text: "Bonus",
                  action: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CatList()));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
