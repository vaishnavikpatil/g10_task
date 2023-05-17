import 'dart:developer';

import 'package:http/http.dart' as http;

Future<http.Response?> readitemdata() async {
  http.Response? response;

  try {
    response = await http.get(Uri.parse("https://dummyjson.com/products"));
  }
  //FOR  EXCEPTIONS
  on Error catch (e) {
    log(e.toString());
  }
  return response;
}
