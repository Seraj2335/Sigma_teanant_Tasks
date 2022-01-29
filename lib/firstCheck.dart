import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sigma_task/dropdownWidget.dart';
import 'package:sigma_task/generateBarCode.dart';
import 'package:sigma_task/localDB.dart';
import 'package:sigma_task/model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class FirstCheck extends StatefulWidget {
  final int value;
  FirstCheck({required this.value});
  @override
  State<FirstCheck> createState() => _FirstCheckState();
}

class _FirstCheckState extends State<FirstCheck> {
  bool isChecked = false;

  int selectedValue = 0;

  // void getData() async {
  //   final response =
  //       await http.get(Uri.parse('https://fakestoreapi.com/products/1'));

  //   final Map<String, dynamic> dataMap = json.decode(response.body);

  //   int data = await LocalDataBase.instance.insert(dataMap);
  //   print(await LocalDataBase.instance.queryAll());
  // }

  // Future<List<Map>> searchData(Database db, String key) async {
  //   if(db)
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
      width: 350,
      height: 440,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 19,
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 73, right: 77),
              //   child: Image(
              //       width: 200,
              //       height: 140,
              //       image: NetworkImage(snapshot.data!.image)),
              // ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.only(left: 50, right: 50),
                padding:
                    EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
                child:
                    BarcodeWidget(data: '132456', barcode: Barcode.code128()),
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Carton ',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Text('Name',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Text('2345678-678',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 31,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Carton 2',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Text('Unit 4',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Text('10 PCS/CTN',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      children: [
                        Text(
                          'Available',
                          style: TextStyle(
                              color: Color(0xff595454),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Container(
                          width: 40,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xff595454)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              selectedValue.toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff595454),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 33,
                        ),
                        Container(
                          width: 60,
                          height: 29,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xff595454)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: DropdownButton(
                            underline: Container(),
                            icon: Container(
                                width: 14,
                                height: 11,
                                child: Image.asset('assets/Polygon 7.png')),
                            items: [
                              DropdownMenuItem(value: 1, child: Text('1')),
                              DropdownMenuItem(value: 2, child: Text('2')),
                              DropdownMenuItem(value: 3, child: Text('3')),
                              DropdownMenuItem(value: 4, child: Text('4')),
                              DropdownMenuItem(value: 5, child: Text('5')),
                              DropdownMenuItem(value: 6, child: Text('6')),
                              DropdownMenuItem(value: 7, child: Text('7')),
                              DropdownMenuItem(value: 8, child: Text('8')),
                              DropdownMenuItem(value: 9, child: Text('9')),
                              DropdownMenuItem(value: 10, child: Text('10'))
                            ],
                            hint: Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Text(
                                'PCS',
                                style: TextStyle(
                                    fontSize: widget.value == 1 ? 12 : 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff595454)),
                              ),
                            ),
                            onChanged: (int? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 37,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 30),
                  width: 151,
                  child: Row(
                    children: [
                      Text(
                        'First Check',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff1AAC0D),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                            checkColor: Color(0xff1AAC0D),
                            activeColor: Colors.white,
                            side: BorderSide(color: Color(0xff1AAC0D)),
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          IconButton(
              padding: EdgeInsets.only(left: 245, top: 11, right: 16),
              onPressed: () => Navigator.pop(context),
              icon: Image.asset('assets/X.png'))
        ],
      ),
    );
  }
}
