import 'package:flutter/material.dart';
import 'package:sigma_task/pages/first_check.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int changedData = 1;

  void updatedValue(int data) {
    setState(() {
      data;
    });
    changedData = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstCheck(
                  updatedValue: updatedValue,
                  value: changedData,
                ),
              ));
        },
        child: Text('Navigate To Main Screen'),
      )),
    ));
  }
}
