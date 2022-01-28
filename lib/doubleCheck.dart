import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sigma_task/firstCheck.dart';
import 'package:sigma_task/formDataBaseValue.dart';
import 'package:sigma_task/generateBarCode.dart';
import 'package:sigma_task/localDB.dart';
import 'package:sigma_task/localDBModel.dart';

import 'package:sigma_task/orderDetails.dart';
import 'package:sigma_task/dropdownWidget.dart';
import 'package:sigma_task/secondCheck.dart';

class DoubleCheck extends StatefulWidget {
  final int value;
  DoubleCheck({required this.value});
  @override
  State<DoubleCheck> createState() => _DoubleCheckState();
}

class _DoubleCheckState extends State<DoubleCheck> {
  late Future<dynamic> barCodeString;
  Future scanBarCode() async {
    String scanResult;
    scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#757575', 'Cancel', true, ScanMode.BARCODE);
    return scanResult;
  }

  @override
  void initState() {
    barCodeString = scanBarCode();
    super.initState();
  }

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
                onPressed: () async {
                  int i = await LocalDataBase.instance
                      .insert({LocalDataBase.columnName: 'Sigma Teanant'});
                  print(i);

                  // showDialog(
                  //     context: context,
                  //     builder: (context) => Dialog(
                  //         child: FirstCheck(
                  //             image: LocalDatabaseFields.id,
                  //             proDuctName: LocalDatabaseFields.description,
                  // barCodeString: LocalDatabaseFields.price)));

                  // print(scanBarCode());
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => Dialog(
                  //           child: FirstCheck(
                  //               barCodeString: "men's clothing",
                  //               image:
                  //                   'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                  //               proDuctName: "men's clothing"),
                  //         ));
                },
                icon: Image.asset('assets/barcode-scanner-1 1.png')),
          )
        ],
        title: Text(
          widget.value == 1
              ? 'Order Details'
              : widget.value == 2
                  ? 'Loading Details'
                  : 'Double Check',
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
                    Text('Order No: ' + "205646",
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
                  contentPadding: EdgeInsets.only(left: 0, right: 0),
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
                  trailing: widget.value == 2
                      ? Container(
                          padding: EdgeInsets.only(left: 11),
                          width: 106,
                          height: 29,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.black54),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: DropDownWidget())
                      : Text(
                          'Assignee: Xyz',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff595454)),
                        )),
            ]),
          ),
          OrderDetails(
            value: widget.value,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 550, left: widget.value == 1 ? 275 : 270),
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
