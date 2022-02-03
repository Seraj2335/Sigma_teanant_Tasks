import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sigma_task/utils/colors.dart';
import 'package:sigma_task/widgets/barcode_dialog.dart';
import 'package:sigma_task/widgets/store_details.dart';
import 'package:sigma_task/widgets/warehouse_footer.dart';
import '../../config/global.dart' as global;

import 'package:sigma_task/model.dart';
import 'package:sigma_task/order_details.dart';
import 'package:http/http.dart' as http;

class DoubleCheck extends StatefulWidget {
  int value;

  DoubleCheck({required this.value});

  @override
  State<DoubleCheck> createState() => _DoubleCheckState();
}

class _DoubleCheckState extends State<DoubleCheck> {
  late Future<dynamic> barCodeString;

  // ValueIncrement value = new ValueIncrement();
  Future<String> scanBarCode() async {
    return await FlutterBarcodeScanner.scanBarcode(
        '#dc7c71', 'Cancel', true, ScanMode.BARCODE);
  }

  Future<Welcome> getStoreDetails() async {
    try {
      Map<String, String> queryParams = {
        'orderId': global.orderId,
        'userId': global.userId,
        'checkNo': widget.value.toString(),
      };
      final uri = Uri.https(
          global.BASE_URL, '/mock/warehouse/product/pending', queryParams);
      final response = await http.get(uri, headers: global.HEADERS);
      var jsonData = jsonDecode(response.body);
      return Welcome.fromJson(jsonData);
    } catch (e) {
      return Welcome.fromJson({});
    }
  }

  Future<void> saveData() async {}

  late Future<Welcome> data;

  @override
  void initState() {
    data = getStoreDetails();
    super.initState();
  }

  List listData = [];

  void getTheFinalList(Map data) {
    listData.add(data);
  }

  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Welcome>(
        future: data,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: CustomColors.DarkOrange,
              actions: [
                Container(
                  // margin: EdgeInsets.only(
                  //     right: MediaQuery.of(context).size.width * 0.05),
                  child: IconButton(
                      iconSize: 25,
                      onPressed: null,
                      icon: Image.asset('assets/refresh 1.png')),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02, top: 5),
                  child: IconButton(
                      iconSize: 30,
                      onPressed: () async {
                        try {
                          String value = await scanBarCode();
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                  child: BarcodeDialog(
                                    barCodeValue: value,
                                    value: widget.value,
                                  )));
                        } catch (e) {
                          print('no data received');
                        }
                      },
                      icon: Image.asset('assets/barcode-scanner-1 1.png')),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: 15,
                        bottom: 10,
                        right: MediaQuery.of(context).size.width * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: TextButton(
                      onPressed: () async {
                        Map<String, dynamic> queryParams = {
                          'orderId': global.orderId,
                          'userId': global.userId,
                          'productDetails': json.encode(listData),
                        };
                        final uri = Uri.https(global.BASE_URL,
                            '/mock/warehouse/save', queryParams);
                        final response =
                        await http.put(uri, headers: global.HEADERS);
                      },
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
              title: Text(
                'Double Check',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
            body: Stack(
              children: [
                FutureBuilder<Welcome>(
                    future: data,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      return StoreDetails(
                        snapshot: snapshot,
                        value: widget.value,
                      );
                    }),
                OrderDetails(
                  value: widget.value,
                  getTheList: getTheFinalList,
                ),
                WarehouseFooter(
                  value: widget.value,
                ),
              ],
            ),
          );
        });
  }
}
