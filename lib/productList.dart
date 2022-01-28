import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sigma_task/firstCheck.dart';
import 'package:sigma_task/loadingCheck.dart';
import 'package:sigma_task/model.dart';
import 'package:sigma_task/secondCheck.dart';
import 'package:http/http.dart' as http;

import 'product.dart';

class ProductList extends StatefulWidget {
  final int value;
  ProductList({required this.value});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<Welcome> getProductData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/1'));
    final jsonData = jsonDecode(response.body);
    return Welcome.fromJson(jsonData);
  }

  late Future<Welcome> proDuctData;

  @override
  void initState() {
    proDuctData = getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Welcome>(
        future: proDuctData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: FirstCheck(),
                          ));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 8),
                  height: widget.value == 3 ? 93 : 79,
                  child: Column(
                    children: [
                      Product(
                        image: snapshot.data!.image,
                        value: widget.value,
                        proDuctName: snapshot.data!.category,
                      ),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
