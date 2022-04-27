import 'package:dio/dio.dart';
import 'dart:typed_data';

Uint8List catImage = Uint8List(0);

Future<Uint8List> getImage() async {
  try {
    var response = await Dio().get('https://cataas.com/cat',
        options: Options(responseType: ResponseType.bytes));
    catImage = response.data;
  } catch (e) {
    print(e);
  }
  return catImage;
}