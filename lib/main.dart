import 'dart:typed_data';
import 'package:api_cat/api/fact.dart';
import 'package:api_cat/api/image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Uint8List? catImage;

  Future<void> _getInfo() async {
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Uint8List>(
                future: getImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasData && !snapshot.hasError) {
                    return Image.memory(snapshot.data!);
                  }
                  if (snapshot.hasError) {
                    return const Text("DEU RUIM");
                  }
                  return const CircularProgressIndicator();
                }),
            // catImage != null ? Image.memory(catImage!) : Icon(Icons.pets),
            FutureBuilder<String>(
                future: getFact(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  Container();
                  }
                  if (snapshot.hasError) {
                    return  Text("deu erro");
                  }
                  if (snapshot.hasData && !snapshot.hasError) {
                    return Text(
                      snapshot.data!,
                    );
                  }
                  return Text("ALGO DEU ERRADO");
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() async => await _getInfo(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
