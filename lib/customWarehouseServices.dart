import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CustomWareHouseServices {
  final bool isChecked = true;
  static const String url = 'https://stl-api-staging.herokuapp.com';
  Future<void> updateProductDetails(bool newValue) async {
    final url = 'https://stl-api-staging.herokuapp.com/mock/warehouse/check/1';
    final response = await http.patch(Uri.parse(url),
        body: jsonEncode(<String, bool>{'isChecked': isChecked}),
        headers: <String, String>{'Content-type': 'application/json'});
    print(response.statusCode);
    print(response.body);
  }
}
