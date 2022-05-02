import 'package:api_cat/pages/cat_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      navigateAfterSeconds: const CatPage(title: "Cat Curiosities"),
      image: Image.asset("images/gifcat2.gif"),
      backgroundColor: const Color.fromARGB(255, 254, 153, 32),
      // FE9920
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.white
    );
  }
}