import 'package:flutter/material.dart';
import 'package:sigma_task/productList.dart';

class OrderDetails extends StatelessWidget {
  final int value;
  Function getTheList;
  OrderDetails({required this.value, required this.getTheList});
  void getArrayValue(Map data) {
    getTheList(data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.72,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.20,
                left: value == 1 ? 13 : 18,
                right: value == 1 ? 12 : 16,
                bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: ProductList(
              getArrayValue: getArrayValue,
              value: value,
            )),
        Container(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffFBA919),
                  padding: EdgeInsets.only(top: 12, bottom: 12)),
              onPressed: () {
                // hello mr. India
              },
              child: Text('Confirm',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF))),
            ))
      ],
    );
  }
}
