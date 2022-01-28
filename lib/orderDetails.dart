import 'package:flutter/material.dart';
import 'package:sigma_task/productList.dart';

class OrderDetails extends StatelessWidget {
  final int value;
  OrderDetails({required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.58,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            top: 165, left: value == 1 ? 13 : 18, right: value == 1 ? 12 : 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: ProductList(
          value: value,
        ));
  }
}
