import 'package:flutter/material.dart';

import 'product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.only(top: 5, left: 15, right: 15),
        height: 70,
        child: Column(
          children: [
            Product(),
            Divider(
              color: Colors.black45,
              height: 2,
            )
          ],
        ),
      ),
      itemCount: 10,
    );
  }
}
