import 'dart:convert';
import 'dart:io';

import 'global.dart' as global;
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:sigma_task/firstCheck.dart';
// import 'package:sigma_task/loadingCheck.dart';

// import 'package:sigma_task/secondCheck.dart';
import 'package:http/http.dart' as http;
import 'package:sigma_task/product.dart';
import 'package:sigma_task/model.dart';
import 'package:sigma_task/model.dart';

class ProductList extends StatefulWidget {
  final int value;
  Function getArrayValue;

  ProductList({required this.value, required this.getArrayValue});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<Welcome> getProductData() async {
    Map<String, String> queryParams = {
      'orderId': global.orderId,
      'userId': global.userId,
      'checkNo': widget.value.toString(),
    };
    try{
      final uri = Uri.https(global.BASE_URL, '/mock/warehouse/product/pending', queryParams);
      final response = await http.get(uri, headers: global.HEADERS);
      var jsonData = jsonDecode(response.body);
      return Welcome.fromJson(jsonData);
    } catch(e) {
      print(e.toString());
      return Welcome.fromJson({});
    }
  }

  late Future<Welcome> proDuctData;

  @override
  void initState() {
    proDuctData = getProductData();
    super.initState();
  }

  void upDateArray(Map data) {
    widget.getArrayValue(data);
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.value==2){
    //   ProductList(value: widget.value, getArrayValue: );
    // }
    return FutureBuilder<Welcome>(
        future: proDuctData,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
                addAutomaticKeepAlives: true,
                itemBuilder: (context, index) => OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.transparent)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                    child: FirstCheck(
                                  barCodeValue: snapshot.data!.tempOrder.id,
                                  value: widget.value,
                                )));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 8),
                        // height: widget.value == 2
                        //     ? MediaQuery.of(context).size.height * 0.15
                        //     : MediaQuery.of(context).size.height / 0.12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ProductData(
                                cartonId: snapshot.data!.tempOrder
                                    .productDetails[index].cartonId,
                                upDateArray: upDateArray,
                                productId: snapshot.data!.tempOrder
                                    .productDetails[index].product.id,
                                orderId: snapshot.data!.tempOrder.id,
                                unit: snapshot.data!.tempOrder
                                    .productDetails[index].product.unit
                                    .toString(),
                                doubleCheck: snapshot.data!.tempOrder
                                    .productDetails[index].doubleCheck,
                                value: widget.value,
                                firstCheck: snapshot.data!.tempOrder
                                    .productDetails[index].firstCheck,
                                imagePath: snapshot.data!.tempOrder
                                    .productDetails[index].product.imagePath,
                                isChecked: snapshot.data!.tempOrder
                                    .productDetails[index].isChecked,
                                itemName: snapshot.data!.tempOrder
                                    .productDetails[index].product.itemName,
                                itemRef: snapshot.data!.tempOrder
                                    .productDetails[index].product.itemRef,
                                loadCheck: snapshot.data!.tempOrder
                                    .productDetails[index].loadCheck,
                                quantityAvailable: snapshot.data!.tempOrder
                                    .productDetails[index].quantityAv,
                                quantityRequired: snapshot.data!.tempOrder
                                    .productDetails[index].quantityReq,
                                unitAvailable: EnumToString.convertToString(
                                    snapshot.data!.tempOrder
                                        .productDetails[index].unitAv),
                                unitRequired: EnumToString.convertToString(
                                    snapshot.data!.tempOrder
                                        .productDetails[index].unitReq)),
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
                itemCount: snapshot.data!.tempOrder.productDetails.length);
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
