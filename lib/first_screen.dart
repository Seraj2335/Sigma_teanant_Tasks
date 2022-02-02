import 'package:flutter/material.dart';
import 'package:sigma_task/warehouse_widget.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int changedData = 1;

  void upDatedValue(int data) {
    setState(() {
      data = 2;
    });
    changedData = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(top: 20, bottom: 20)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoubleCheck(
                  updatedValue: upDatedValue,
                  value: changedData,
                ),
              ));
        },
        child: Text('Navigate To MainScreen'),
      )),
    ));
  }
}
