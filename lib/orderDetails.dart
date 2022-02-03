import 'dart:convert';

import 'package:sigma_task/utils/colors.dart';

import 'global.dart' as global;
import 'package:flutter/material.dart';
import 'package:sigma_task/productList.dart';
import 'package:http/http.dart' as http;

class OrderDetails extends StatefulWidget {
  final int value;
  Function getTheList;
  Function changeCheckValue;

  OrderDetails(
      {required this.value,
      required this.getTheList,
      required this.changeCheckValue});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List confirmDataList = [];

  void getArrayValue(Map data) {
    confirmDataList.add(data);
    widget.getTheList(data);
  }

  bool confirmed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.72,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.20,
                left: widget.value == 1 ? 13 : 18,
                right: widget.value == 1 ? 12 : 16,
                bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: ProductList(
              getArrayValue: getArrayValue,
              value: widget.value,
            )),
        Container(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary:  CustomColors.DarkOrange,
                  padding: EdgeInsets.only(top: 12, bottom: 12)),
              onPressed: () async {
                setState(() {
                  confirmed = !confirmed;
                });
                try {
                  var response = await http.put(
                      Uri.https(global.BASE_URL, '/mock/warehouse/confirm/1'),
                      body: jsonEncode({
                        "orderId": global.orderId,
                        "userId": global.userId,
                        "productDetails": confirmDataList
                      }),
                      headers: global.HEADERS);
                  setState(() {
                    confirmed = true;
                  });
                  if (response.statusCode == 200) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.10,
                          child: Center(
                            child: Text(
                              "Confirmed",
                              style: TextStyle(
                                  color: CustomColors.DarkOrange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
              child: confirmed == false
                  ? CircularProgressIndicator(
                      color: Color(0xffFFFFFF),
                    )
                  : Text('Confirm',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF))),
            ))
      ],
    );
  }
}
