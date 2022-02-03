import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sigma_task/utils/colors.dart';
import 'global.dart' as global;

import 'package:sigma_task/firstCheck.dart';
import 'package:sigma_task/model.dart';
import 'package:sigma_task/orderDetails.dart';
import 'package:http/http.dart' as http;

class DoubleCheck extends StatefulWidget {
  int value;
  final Function updatedValue;

  DoubleCheck({required this.value, required this.updatedValue});

  @override
  State<DoubleCheck> createState() => _DoubleCheckState();
}

class _DoubleCheckState extends State<DoubleCheck> {
  late Future<dynamic> barCodeString;

  // ValueIncrement value = new ValueIncrement();
  Future<String> scanBarCode() async {
    return await FlutterBarcodeScanner.scanBarcode(
        '#dc7c71', 'Cancel', true, ScanMode.BARCODE);
  }

  Future<Welcome> getStoreDetails() async {
    try {
      Map<String, String> queryParams = {
        'orderId': global.orderId,
        'userId': global.userId,
        'checkNo': widget.value.toString(),
      };
      final uri = Uri.https(
          global.BASE_URL, '/mock/warehouse/product/pending', queryParams);
      final response = await http.get(uri, headers: global.HEADERS);
      var jsonData = jsonDecode(response.body);
      return Welcome.fromJson(jsonData);
    } catch (e) {
      return Welcome.fromJson({});
    }
  }

  Future<void> saveData() async {}

  late Future<Welcome> data;

  @override
  void initState() {
    data = getStoreDetails();
    super.initState();
  }

  // DetailsArray detaArra = new DetailsArray();

  List listData = [];

  void getTheFinalList(Map data) {
    listData.add(data);
  }

  void changeCheckValue(int data) {
    widget.updatedValue(data);
  }

  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Welcome>(
        future: data,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: CustomColors.DarkOrange,
              actions: [
                Container(
                  // margin: EdgeInsets.only(
                  //     right: MediaQuery.of(context).size.width * 0.05),
                  child: IconButton(
                      iconSize: 25,
                      onPressed: null,
                      icon: Image.asset('assets/refresh 1.png')),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02, top: 5),
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
                Container(
                    margin: EdgeInsets.only(
                        top: 15,
                        bottom: 10,
                        right: MediaQuery.of(context).size.width * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: TextButton(
                      onPressed: () async {
                        Map<String, dynamic> queryParams = {
                          'orderId': global.orderId,
                          'userId': global.userId,
                          'productDetails': json.encode(listData),
                        };
                        final uri = Uri.https(
                            global.BASE_URL, '/mock/warehouse/save', queryParams);
                        final response = await http.put(uri, headers: global.HEADERS);
                      },
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
              title: Text(
                widget.value == 1
                    ? 'Order Details'
                    : widget.value == 3
                        ? 'Loading Check'
                        : 'Double Check',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
                                width: MediaQuery.of(context).size.width * 0.85,
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.15,
                                  top: 9,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Order No: ' +
                                            snapshot.data!.tempOrder
                                                .tempOrderInvoiceNo,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
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
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                        'Order Date: ' +
                                            snapshot.data!.tempOrder.date
                                                .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text('Marks: ' + 'APT',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.002,
                              ),
                              ListTile(
                                  contentPadding:
                                      EdgeInsets.only(left: 0, right: 0),
                                  leading: Container(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Text(
                                      'Order Details:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  trailing: widget.value == 2
                                      ? Container(
                                          padding: EdgeInsets.only(left: 11),
                                          width: 106,
                                          height: 29,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.black54),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: DropdownButton(
                                              underline: Container(),
                                              icon: Container(
                                                  width: 14,
                                                  height: 11,
                                                  child: Image.asset(
                                                      'assets/Polygon 7.png')),
                                              items: [
                                                DropdownMenuItem(
                                                    value: 1, child: Text('1')),
                                                DropdownMenuItem(
                                                    value: 2, child: Text('2')),
                                                DropdownMenuItem(
                                                    value: 3, child: Text('3')),
                                              ],
                                              hint: Container(
                                                margin:
                                                    EdgeInsets.only(left: 12),
                                                child: Text(
                                                  'Assignee',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              onChanged: (int? value) {
                                                setState(() {
                                                  selectedValue = value!;
                                                });
                                              }))
                                      : Text(
                                          'Assignee: Santosh',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        )),
                            ]),
                      );
                    }),
                OrderDetails(
                  changeCheckValue: changeCheckValue,
                  value: widget.value,
                  getTheList: getTheFinalList,
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      widget.updatedValue(widget.value);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          widget.value == 1
                                              ? 'Go to Double Check'
                                              : 'Next',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: CustomColors.DarkOrange,
                                          ),
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
        });
  }
}
