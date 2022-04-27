import 'package:dio/dio.dart';

String catFact = "";

Future<String> getFact() async {
  try {
    var response =
        await Dio().get('https://catfact.ninja/fact');
    catFact = response.data["fact"];
  } catch (e) {
    print(e);
  }
  return catFact;
}