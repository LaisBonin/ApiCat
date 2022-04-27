import 'dart:typed_data';
import 'package:api_cat/api/fact.dart';
import 'package:api_cat/api/image.dart';
import 'package:api_cat/widget/next_button.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                      return Image.memory(snapshot.data!);
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
                      return Text(
                        snapshot.data!,
                      );
                    }
                    return const Text("ALGO DEU ERRADO");
                  }),
                 const NextButton()
                   
                 
            ],
            
          ),
          
          floatingActionButton: FloatingActionButton(
            onPressed: _getInfo,
            tooltip: '',
            child: const Icon(Icons.add),
          ),
        ));
  }
}
