import 'package:flutter/material.dart';

class ValueIncrement {
  List<String> data = ['orderCheck', 'loadingCheck', 'doubleCheck'];
  int count = 0;
  String? value;
  void changeValue() {
    if (count <= 1) {
      count++;
    } else {
      count = 0;
    }
  }
}
