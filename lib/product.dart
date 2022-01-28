import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sigma_task/piecesdropDown.dart';
import 'package:sigma_task/model.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  final String image;
  final String proDuctName;

  final int value;
  Product(
      {required this.value, required this.image, required this.proDuctName});
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isChecked = false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> list = {
      'productName': 'Product Name',
      'id': "657890-9",
      'model': "Carton #25"
    };

    return Row(children: [
      Container(
        width: 50,
        height: 50,
        // color: Color(0xffF7A51C),
        color: Colors.white,
        child: Image(image: NetworkImage(widget.image)),
      ),
      widget.value == 1
          ? SizedBox(
              width: 7,
            )
          : SizedBox(
              width: 13,
            ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.proDuctName,
              style: TextStyle(
                  color: Color(0xff595454),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat')),
          SizedBox(
            height: 1,
          ),
          Text(list['id'],
              style: TextStyle(
                  color: Color(0xff595454),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat')),
          SizedBox(
            height: 1,
          ),
          widget.value == 3
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
              ? Container(
                  width: 35,
                  height: 15,
                  child: Text(
                    '12345',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Montserrat'),
                  ),
                )
              : Text(list['model'],
                  style: TextStyle(
                      color: Color(0xffffaa00),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat')),
        ],
      ),
      widget.value == 1
          ? SizedBox(
              width: 7,
            )
          : SizedBox(
              width: 9,
            ),
      widget.value == 1
          ? Container(
              margin: EdgeInsets.only(top: 10),
              width: 56,
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: Color(
                        0xff595454,
                      ),
                      width: 1)),
              child: Center(child: PiecesDropDown()))
          : SizedBox(
              width: 1,
            ),
      widget.value == 1
          ? SizedBox(
              width: 12,
            )
          : SizedBox(
              width: 10,
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
                    _value.toString(),
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
              width: 16,
            )
          : SizedBox(
              width: 30,
            ),
      // Checkbox section
      Container(
        margin: EdgeInsets.only(
          top: widget.value == 1 ? 20 : 0,
        ),
        width: widget.value == 1 ? 20 : 30,
        height: widget.value == 1 ? 20 : 30,
        child: Checkbox(
            value: isChecked,
            onChanged: (newValue) {
              setState(() {
                isChecked = newValue!;
              });
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
