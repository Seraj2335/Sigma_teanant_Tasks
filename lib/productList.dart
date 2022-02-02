import 'dart:convert';
import 'global.dart' as global;
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:sigma_task/firstCheck.dart';
// import 'package:sigma_task/loadingCheck.dart';

// import 'package:sigma_task/secondCheck.dart';
import 'package:http/http.dart' as http;
import 'package:sigma_task/product.dart';
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
    // String url = global.BASE_URL;
    // var queryParameters = {
    //   'orderId': "61f3b7b2d17b1cd797c19de8",
    //   'userId': "5fcb6fd3a7000000171173c2",
    //   'checkNo': 1
    // };
    // var uri =
    //     Uri.https(url, '/mock/warehouse/product/pending', queryParameters);
    final response = await http.get(Uri.parse(
        'https://stl-api-staging.herokuapp.com/mock/warehouse/product/pending?orderId=61f3b7b2d17b1cd797c19de8&userId=5fcb6fd3a7000000171173c2&checkNo=1'));
    final jsonData = jsonDecode(response.body);

    return Welcome.fromJson(jsonData);
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
