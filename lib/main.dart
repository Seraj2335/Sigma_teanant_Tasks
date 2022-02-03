import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sigma_task/pages/home_screen.dart';

void main() async {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sigma Tenant',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.amber),
      home: HomeScreen(),
    );
  }
}
