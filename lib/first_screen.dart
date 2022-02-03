import 'package:flutter/material.dart';
import 'package:sigma_task/warehouse_widget.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int changedData = 1;

  void updatedValue(int data) {
    setState(() {
      data+=1;
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
                builder: (context) => DoubleCheck(
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
