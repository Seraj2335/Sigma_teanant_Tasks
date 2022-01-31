import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductData extends StatefulWidget {
  final int value;
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
  ProductData(
      {required this.productId,
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
      required this.unitRequired});
  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  // late bool isChecked;

  int selectedValue = 0;
  Future<void> updateProductDetails(bool newValue) async {
    final url = 'https://stl-api-staging.herokuapp.com/mock/warehouse/check/1';
    final data = {
      "check": widget.isChecked,
      "productId": widget.productId,
      "orderId": widget.orderId,
      "userId": "5fcb6fd3a7000000171173c2"
    };
    final response = await http.patch(Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-type': 'application/json'
        }).then((res) {
      setState(() {
        widget.isChecked = newValue;
      });
    });
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Row(children: [
      // Container(
      //   width: size / 18,
      //   height: sizeh / 18,
      //   // color: Color(0xffF7A51C),
      //   color: Colors.white,
      //   child: Image(image: NetworkImage()),
      // ),
      widget.value == 1
          ? SizedBox(width: size / 20)
          : SizedBox(width: sizeh / 18),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 98,
            child: Text(widget.itemName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xff595454),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat')),
          ),
          Text(widget.itemRef,
              style: TextStyle(
                  color: Color(0xff595454),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat')),
          SizedBox(
            height: 1,
          ),
          widget.value == 2
              ? Text('10 PCS/CTN',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff000000),
                      fontFamily: 'Montserrat'))
              : SizedBox(
                  height: 0,
                ),
          widget.value == 1
              ? Text(
                  '12345',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Montserrat'),
                )
              : Text('',
                  style: TextStyle(
                      color: Color(0xffffaa00),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat')),
        ],
      ),
      widget.value == 1
          ? SizedBox(
              width: size / 20,
            )
          : SizedBox(
              width: size / 18,
            ),
      widget.value == 1
          ? Container(
              margin: EdgeInsets.only(top: 10),
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: Color(
                        0xff595454,
                      ),
                      width: 1)),
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
                  DropdownMenuItem(value: 10, child: Text('10')),
                ],
                hint: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    widget.unitAvailable,
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
              ))
          : SizedBox(
              width: 1,
            ),
      widget.value == 1
          ? SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width / 18,
            ),
      //Product Available Section
      Column(
        children: [
          Text('Available',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight:
                      widget.value == 1 ? FontWeight.w300 : FontWeight.w500,
                  fontSize: widget.value == 1 ? 11 : 12,
                  color: widget.value == 1
                      ? Color(0xff000000)
                      : Color(0xff595454))),
          SizedBox(
            height: 6,
          ),
          widget.value == 1
              ? Container(
                  width: 30,
                  height: 22,
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
              : Text('3PCS',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff595454)))
        ],
      ),
      widget.value == 1
          ? SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width / 18,
            ),
      // Checkbox section
      Container(
        margin: EdgeInsets.only(
          top: widget.value == 1 ? 20 : 0,
        ),
        width: widget.value == 1 ? 20 : 30,
        height: widget.value == 1 ? 20 : 30,
        child: Checkbox(
            value: widget.isChecked,
            onChanged: (newValue) {
              // setState(() {
              //   isChecked = !newValue!;

              // });
              updateProductDetails(newValue!);
            }),
      )
    ]);
  }
}

// class CheckBoxWidget extends StatelessWidget {
//   final bool isChecked;
//   final Function checkboxCallBack;
//   CheckBoxWidget({required this.checkboxCallBack, required this.isChecked});
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         checkColor: Colors.green,
//         value: isChecked,
//         onChanged: checkboxCallBack());
//   }
// }
