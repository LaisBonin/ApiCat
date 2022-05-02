import 'package:dio/dio.dart';

Future<String> getFact() async {
  var response = await Dio().get('https://catfact.ninja/fact');
  final catFact = response.data["fact"];
  return catFact;
}
