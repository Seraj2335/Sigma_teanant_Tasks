import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    required this.dropDownCallBack,
    required this.unitAvailable,
    required this.value,
    required this.unit,
  });

  final String unitAvailable;
  final int value;
  final String unit;
  final Function dropDownCallBack;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  int selectedValue = 0;
  var itemArr = [
    DropdownMenuItem(
      value: 'CTN',
      child: Text('CTN'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      icon: Container(
          height: 20,
          child: Image.asset('assets/Polygon 7.png')
      ),
      items: [
        DropdownMenuItem(value: 1, child: Text('CTN')),
        DropdownMenuItem(value: 2, child: Text(widget.unit)),
      ],
      hint: Container(
        margin: EdgeInsets.only(left: 12),
        child: Text(
          widget.unitAvailable,
          style: TextStyle(
              fontSize: widget.value == 1 ? 12 : 14,
              fontWeight: FontWeight.w600,
          )
        ),
      ),
      onChanged: (int? value) {
        widget.dropDownCallBack(value);
      },
    );
  }
}
