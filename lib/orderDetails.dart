import 'package:flutter/material.dart';
import 'package:sigma_task/productList.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 410,
        margin: EdgeInsets.only(top: 140, left: 15, right: 15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: ProductList());
  }
}
