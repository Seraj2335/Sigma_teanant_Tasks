import 'package:flutter/material.dart';
import 'package:sigma_task/pages/double_check.dart';
import 'package:sigma_task/pages/loading_check.dart';
import 'package:sigma_task/utils/colors.dart';

class WarehouseFooter extends StatefulWidget {
  final int value;

  WarehouseFooter({required this.value});

  @override
  _WarehouseFooterState createState() => _WarehouseFooterState();
}

class _WarehouseFooterState extends State<WarehouseFooter> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          alignment: Alignment.bottomRight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                    onPressed: () {
                      switch(widget.value+1){
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoubleCheck(
                                  value: 2,
                                ),
                              ));
                          break;
                        case 3:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoadingCheck(
                                  value: 3,
                                ),
                              ));
                          break;
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          widget.value == 1 ? 'Go to Double Check' : 'Next',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.DarkOrange,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                        ),
                      ],
                    )),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
