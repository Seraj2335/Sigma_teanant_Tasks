import 'package:flutter/material.dart';

class ValueIncrement {
  List<String> data = ['orderCheck', 'loadingCheck', 'doubleCheck'];
  int count = 0;
  String? value;
  void getData() {
    value = data[count];
  }

  void changeValue() {
    count++;
    if (count == 3) {
      count = 0;
    }
  }
}
