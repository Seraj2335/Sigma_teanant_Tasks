import 'package:flutter/material.dart';

import 'product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.only(top: 8, left: 13, right: 14),
        height: 79,
        child: Column(
          children: [
            Product(),
            SizedBox(
              height: 16,
            ),
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
