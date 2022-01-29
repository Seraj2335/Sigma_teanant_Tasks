import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sigma_task/doubleCheck.dart';
import 'package:sigma_task/screenValue.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  ValueIncrement value = new ValueIncrement();
  @override
  Widget build(BuildContext context) {
    value.changeValue();
    print(value.value);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sigma Teanant',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.amber),
      home: DoubleCheck(
        value: 1,
      ),
    );
  }
}
