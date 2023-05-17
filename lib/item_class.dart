import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g10_task/item_model.dart';
import 'package:g10_task/item_service.dart';
import 'package:http/http.dart' as http;

class ItemClass with ChangeNotifier {
  List<ItemModelBody> itemList = [];
  List<dynamic> responseData = [];
  Future<void> item() async {


    http.Response? response = await readitemdata();

    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      responseData = json.decode(response.body)["products"];
     

      itemList = responseData.map((json) {
        return ItemModelBody.fromJson(json);
      }).toList();
    }


    notifyListeners();
  }
}
