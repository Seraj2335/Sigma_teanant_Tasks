import 'package:flutter/material.dart';

import 'package:sigma_task/orderDetails.dart';
import 'package:sigma_task/dropdownWidget.dart';

class DoubleCheck extends StatefulWidget {
  @override
  State<DoubleCheck> createState() => _DoubleCheckState();
}

class _DoubleCheckState extends State<DoubleCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Double Check',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ))),
          Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                  )))
        ],
      ),
      body: Stack(
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(left: 100),
                child: Column(
                  children: [
                    Text('Order No: '),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Store Name:'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Order Date:'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Marks:'),
                  ],
                ),
              ),
              ListTile(
                  leading: Text('Order Details:'),
                  trailing: Container(
                      width: 95,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black54),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: DropDownWidget()))
            ]),
          ),
          OrderDetails(),
          Container(
              margin: EdgeInsets.only(top: 550, left: 270),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text('Next'),
                      Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
