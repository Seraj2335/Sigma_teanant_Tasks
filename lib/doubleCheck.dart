import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sigma_task/firstCheck.dart';

import 'package:sigma_task/generateBarCode.dart';
import 'package:sigma_task/localDB.dart';
import 'package:sigma_task/model.dart';

import 'package:sigma_task/orderDetails.dart';
import 'package:sigma_task/dropdownWidget.dart';
import 'package:sigma_task/product.dart';
import 'package:sigma_task/screenValue.dart';
import 'package:sigma_task/secondCheck.dart';
import 'package:http/http.dart' as http;
import 'package:sigma_task/model.dart';

class DoubleCheck extends StatefulWidget {
  int value;
  DoubleCheck({required this.value});
  @override
  State<DoubleCheck> createState() => _DoubleCheckState();
}

class _DoubleCheckState extends State<DoubleCheck> {
  late Future<dynamic> barCodeString;
  ValueIncrement value = new ValueIncrement();
  Future<String> scanBarCode() async {
    return await FlutterBarcodeScanner.scanBarcode(
        '#dc7c71', 'Cancel', true, ScanMode.BARCODE);
  }

  Future<Welcome> getStoreDetails() async {
    String url =
        'https://stl-api-staging.herokuapp.com/mock/warehouse/product/pending?orderId=61f3b7b2d17b1cd797c19de8&userId=5fcb6fd3a7000000171173c2&checkNo=1';
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    return Welcome.fromJson(jsonData);
  }

  late Future<Welcome> data;
  @override
  void initState() {
    data = getStoreDetails();
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
                  try {
                    String value = await scanBarCode();
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                                child: FirstCheck(
                              barCodeValue: value,
                              value: widget.value,
                            )));
                  } catch (e) {
                    print('no data received');
                  }
                },
                icon: Image.asset('assets/barcode-scanner-1 1.png')),
          ),
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
          FutureBuilder<Welcome>(
              future: data,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container(
                  margin: EdgeInsets.only(left: 18, right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.25,
                            top: 9,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Order No: ' +
                                      snapshot
                                          .data!.tempOrder.tempOrderInvoiceNo,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Montserrat')),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                  'Store Name: ' +
                                      snapshot.data!.tempOrder.store,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Montserrat')),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                  'Order Date: ' +
                                      snapshot.data!.tempOrder.date.toString(),
                                  overflow: TextOverflow.ellipsis,
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
                                        border: Border.all(
                                            width: 0.5, color: Colors.black54),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
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
                );
              }),
          OrderDetails(
            value: widget.value,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                alignment: Alignment.bottomRight,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                          onPressed: () {
                            // value.increment();
                          },
                          child: Row(
                            children: [
                              Text(
                                'Go to Double Check',
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
                          )),
                    ]),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
