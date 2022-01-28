import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GenerateBarCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: 100,
          height: 60,
          padding: EdgeInsets.only(top: 10, left: 5, right: 5),
          child: BarcodeWidget(
            barcode: Barcode.code128(),
            data: '12314565',
          ),
        ),
      ),
    );
  }
}
