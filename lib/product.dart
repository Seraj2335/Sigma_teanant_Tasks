import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sigma_task/dropdownWidget.dart';
import 'package:http/http.dart' as http;

class ProductData extends StatefulWidget {
  List<dynamic> cartonId;
  Function upDateArray;
  int value;
  bool isChecked;
  bool firstCheck;
  bool loadCheck;
  bool doubleCheck;
  int quantityAvailable;
  String unitAvailable;
  String itemRef;
  String itemName;
  String imagePath;
  int quantityRequired;
  String unitRequired;
  String unit;
  String orderId;
  String productId;
  int ratio;

  ProductData({
    required this.cartonId,
    required this.upDateArray,
    required this.productId,
    required this.orderId,
    required this.unit,
    required this.doubleCheck,
    required this.value,
    required this.firstCheck,
    required this.imagePath,
    required this.isChecked,
    required this.itemName,
    required this.itemRef,
    required this.loadCheck,
    required this.quantityAvailable,
    required this.quantityRequired,
    required this.unitAvailable,
    required this.unitRequired,
    required this.ratio,
  });

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int selectedValue = 0;

  bool csChecked = true;

  void dropDownCallBackFunction(int value) {
    setState(() {
      selectedValue = value;
    });
  }

  Future<void> updateProductDetails(bool newValue) async {
    final url = 'https://stl-api-staging.herokuapp.com/mock/warehouse/check/1';
    final data = {
      "check": newValue,
      "productId": widget.productId,
      "orderId": widget.orderId,
      "userId": "5fcb6fd3a7000000171173c2"
    };

    final response = await http.patch(Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{'Content-type': 'application/json'});
    setState(() {
      widget.firstCheck = newValue;
      csChecked = !csChecked;
    });
    // print(response.statusCode);
    // print(response.body);
    // print(response.statusCode);
  }

  void checkBoxCallBack(bool value) {
    widget.isChecked = value;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double size = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;

    return Row(children: [
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.05,
          height: MediaQuery.of(context).size.height * 0.08,
          // color: Color(0xffF7A51C),
          color: Colors.white,
          child: Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max')),
        ),
      ),
      widget.value == 1 ? SizedBox(width: 0) : SizedBox(width: size / 25),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.itemName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(widget.itemRef,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff595454))),
            SizedBox(
              height: 1,
            ),
            widget.value == 3
                ? Text(
                    '3PCS/CTN',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  )
                : SizedBox(
                    height: 0,
                  ),
            (widget.value == 2)
                ? Text(
                    widget.cartonId.length == 2
                        ? "Carton #" +
                            widget.cartonId[0].toString() +
                            " - " +
                            widget.cartonId[1].toString()
                        : "Carton #" + widget.cartonId[0].toString(),
                    style: TextStyle(
                      color: Color(0xffFFA000),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                : Text(widget.cartonId.toString(),
                    style: TextStyle(
                        color: Color(0xffffaa00),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat')),
          ],
        ),
      ),
      widget.value == 1
          ? SizedBox(
              width: 0,
            )
          : SizedBox(
              width: size / 25,
            ),
      widget.value == 1
          ? Expanded(
              child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Color(
                            0xff595454,
                          ),
                          width: 1)),
                  child: Center(
                      child: DropDownWidget(
                          dropDownCallBack: dropDownCallBackFunction,
                          unitAvailable: widget.unitAvailable,
                          value: widget.value))),
            )
          : SizedBox(
              width: 0,
            ),
      widget.value == 1
          ? SizedBox(
              width: 0,
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width / 18,
            ),
      //Product Available Section
      Expanded(
        child: Column(
          children: [
            Text(
              'Available',
              style: TextStyle(
                  fontWeight:
                      widget.value == 1 ? FontWeight.w300 : FontWeight.w500,
                  fontSize: widget.value == 1 ? 11 : 12,
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.004,
            ),
            widget.value == 1
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.08,
                    height: MediaQuery.of(context).size.height * 0.03,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Color(0xffA4A4A4))),
                    child: Center(
                        child: Text(
                      widget.quantityAvailable.toString(),
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Montserrat'),
                    )),
                  )
                : Text(widget.unitAvailable,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff595454)))
          ],
        ),
      ),
      widget.value == 1
          ? SizedBox(
              width: 0,
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width / 18,
            ),
      // Checkbox section
      Expanded(
        child: Container(
            margin: EdgeInsets.only(
              top: widget.value == 1 ? 20 : 0,
            ),
            width: widget.value == 1 ? 10 : 30,
            height: widget.value == 1 ? 20 : 30,
            child: csChecked == false
                ? CircularProgressIndicator()
                : Checkbox(
                    value: widget.firstCheck,
                    onChanged: (newValue) async {
                      setState(() {
                        csChecked = !csChecked;
                      });

                      await updateProductDetails(newValue!);
                      if (newValue == true)
                        widget.upDateArray(
                          {
                            "productId": widget.productId,
                            "quantityAv": widget.quantityAvailable,
                            "firstCheck": widget.firstCheck,
                            "unitAv": widget.unitAvailable
                          },
                        );
                    })),
      )
    ]);
  }
}
