import 'package:flutter/material.dart';
import 'package:sigma_task/firstCheck.dart';
import 'package:sigma_task/loadingCheck.dart';
import 'package:sigma_task/secondCheck.dart';

import 'product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.transparent)),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: LoadingCheck(),
                  ));
        },
        child: Container(
          padding: EdgeInsets.only(top: 8),
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
      ),
      itemCount: 10,
    );
  }
}
