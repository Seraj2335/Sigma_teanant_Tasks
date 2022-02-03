import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sigma_task/widgets/custom_dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:sigma_task/utils/colors.dart';
import 'package:sigma_task/widgets/av_quantity_input.dart';
import '../../config/global.dart' as global;

class ProductData extends StatefulWidget {
  List<dynamic> cartonId;
  Function upDateArray;
  final int value;
  bool isChecked;
  bool firstCheck;
  bool loadCheck;
  bool doubleCheck;
  int quantityAvailable;
  String unitAvailable;
  String itemRef;
  String itemName;
  String imagePath;
  int quantityRequired;
  String unitRequired;
  String unit;
  String orderId;
  String productId;
  int ratio;

  ProductData({
    required this.cartonId,
    required this.upDateArray,
    required this.productId,
    required this.orderId,
    required this.unit,
    required this.doubleCheck,
    required this.value,
    required this.firstCheck,
    required this.imagePath,
    required this.isChecked,
    required this.itemName,
    required this.itemRef,
    required this.loadCheck,
    required this.quantityAvailable,
    required this.quantityRequired,
    required this.unitAvailable,
    required this.unitRequired,
    required this.ratio,
  });

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int selectedValue = 0;

  bool csChecked = true;

  void dropdownCallback(int value) {
    setState(() {
      selectedValue = value;
    });
  }

  Future<void> updateProductDetails(bool newValue) async {
    final url = 'https://stl-api-staging.herokuapp.com/mock/warehouse/check/1';
    final data = {
      "check": newValue,
      "productId": widget.productId,
      "orderId": widget.orderId,
      "userId": global.userId,
    };

    final response = await http.patch(Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{'Content-type': 'application/json'});
    setState(() {
      widget.firstCheck = newValue;
      csChecked = !csChecked;
    });
  }

  void checkBoxCallBack(bool value) {
    widget.isChecked = value;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double size_w = MediaQuery.of(context).size.width;
    return Row(children: [
      // Container(
      //   width: size / 18,
      //   height: sizeh / 18,
      //   // color: Color(0xffF7A51C),
      //   color: Colors.white,
      //   child: Image(image: NetworkImage()),
      // ),
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.itemName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(widget.itemRef,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              height: 1,
            ),
            Text(
              widget.ratio.toString() + ' ' + widget.unit + '/CTN',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              widget.quantityRequired.toString() + ' ' + widget.unitRequired,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            if (widget.value != 1 && widget.cartonId.length > 0)
              Text(
                widget.cartonId.length == 2
                    ? "Carton #" +
                        widget.cartonId[0].toString() +
                        " - " +
                        widget.cartonId[1].toString()
                    : "Carton #" + widget.cartonId[0].toString(),
                style: TextStyle(
                  color: CustomColors.DarkOrange,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
          ],
        ),
      ),
      widget.value == 1
          ? Expanded(
              flex: 2,
              child: Column(
                children: [
                  if (size_w < 700)
                    Column(
                      children: [
                        Text(
                          'Available',
                          style: TextStyle(
                              fontWeight: widget.value == 1
                                  ? FontWeight.w400
                                  : FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        widget.value == 1
                            ? AvailableQuantityInput(
                                quantityAv: widget.quantityAvailable)
                            : Text(
                                widget.quantityAvailable.toString() +
                                    ' ' +
                                    widget.unitAvailable,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              )
                      ],
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1)),
                    child: Center(
                      child: CustomDropdown(
                        dropdownCallback: dropdownCallback,
                        unitAvailable: (widget.unitAvailable == 'CARTONS')
                            ? 'CTN'
                            : widget.unitAvailable,
                        value: (selectedValue == 0 &&
                                widget.unitAvailable == 'CARTONS')
                            ? 1
                            : ((selectedValue == 0 &&
                                    widget.unitAvailable != 'CARTONS')
                                ? 2
                                : selectedValue),
                        unit: widget.unit,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
              width: 1,
            ),
      if (size_w > 700)
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(
                'Available',
                style: TextStyle(
                    fontWeight:
                        widget.value == 1 ? FontWeight.w400 : FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black),
              ),
              widget.value == 1
                  ? AvailableQuantityInput(quantityAv: widget.quantityAvailable)
                  : Text(
                      widget.quantityAvailable.toString() +
                          ' ' +
                          widget.unitAvailable,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    )
            ],
          ),
        ),
      Expanded(
        flex: 1,
        child: Container(
            margin: EdgeInsets.only(
              top: widget.value == 1 ? 20 : 0,
            ),
            child: csChecked == false
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Checkbox(
                    value: widget.firstCheck,
                    onChanged: (newValue) async {
                      setState(() {
                        csChecked = !csChecked;
                      });
                      await updateProductDetails(newValue!);
                      if (newValue == true)
                        widget.upDateArray(
                          {
                            "productId": widget.productId,
                            "quantityAv": widget.quantityAvailable,
                            "firstCheck": widget.firstCheck,
                            "unitAv": widget.unitAvailable
                          },
                        );
                    })),
      )
    ]);
  }
}
