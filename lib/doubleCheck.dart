import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:sigma_task/orderDetails.dart';
import 'package:sigma_task/dropdownWidget.dart';
import 'package:sigma_task/secondCheck.dart';

class DoubleCheck extends StatefulWidget {
  @override
  State<DoubleCheck> createState() => _DoubleCheckState();
}

class _DoubleCheckState extends State<DoubleCheck> {
  String scanResult = '00000';
  // Future scanBarCode() async {
  //   String scanResul;
  //   try {
  //     scanResul = await FlutterBarcodeScanner.scanBarcode(
  //         "#FFFFFF", "Cancel", true, ScanMode.BARCODE);
  //     print(scanResul);
  //   } on PlatformException {
  //     scanResul = "Failed to get result";
  //   }
  //   if (mounted) return;
  //   setState(() {
  //     this.scanResult = scanResul;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7A51C),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 22),
            child: IconButton(
                iconSize: 25,
                onPressed: null,
                icon: Image.asset('assets/refresh 1.png')),
          ),
          Container(
            margin: EdgeInsets.only(right: 15, top: 5),
            child: IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondCheck()));
                },
                icon: Image.asset('assets/barcode-scanner-1 1.png')),
          )
        ],
        title: Text(
          'Double Check',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 18, right: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(
                  left: 89,
                  top: 9,
                ),
                child: Column(
                  children: [
                    Text('Order No: ' + "205646" + "    ${scanResult}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat')),
                    SizedBox(
                      height: 6,
                    ),
                    Text('Store Name: ' + 'Xyzabc',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat')),
                    SizedBox(
                      height: 6,
                    ),
                    Text('Order Date: ' + '22-09-2024',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat')),
                    SizedBox(
                      height: 6,
                    ),
                    Text('Marks: ' + 'APT',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat')),
                  ],
                ),
              ),
              SizedBox(
                height: 23,
              ),
              ListTile(
                  leading: Container(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      'Order Details:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  trailing: Container(
                      padding: EdgeInsets.only(left: 11),
                      width: 106,
                      height: 29,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.black54),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFA000),
                            fontFamily: 'Montserrat'),
                      ),
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
