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
      data+=1;
    });
    changedData = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            DoubleCheck(
              updatedValue: upDatedValue,
              value: changedData,
            ),
        ));
      },
      child: null,
    )));
  }
}
