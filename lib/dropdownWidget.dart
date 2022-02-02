import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    required this.dropDownCallBack,
    required this.unitAvailable,
    required this.value,
  });

  final String unitAvailable;
  final int value;
  final Function dropDownCallBack;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      icon: Container(
          width: 14, height: 11, child: Image.asset('assets/Polygon 7.png')),
      items: [
        DropdownMenuItem(value: 1, child: Text('1')),
        DropdownMenuItem(value: 2, child: Text('2')),
        DropdownMenuItem(value: 3, child: Text('3')),
        DropdownMenuItem(value: 4, child: Text('4')),
        DropdownMenuItem(value: 5, child: Text('5')),
        DropdownMenuItem(value: 6, child: Text('6')),
        DropdownMenuItem(value: 7, child: Text('7')),
        DropdownMenuItem(value: 8, child: Text('8')),
        DropdownMenuItem(value: 9, child: Text('9')),
        DropdownMenuItem(value: 10, child: Text('10')),
      ],
      hint: Container(
        margin: EdgeInsets.only(left: 12),
        child: Text(
          widget.unitAvailable,
          style: TextStyle(
              fontSize: widget.value == 1 ? 12 : 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Color(0xff595454)),
        ),
      ),
      onChanged: (int? value) {
        widget.dropDownCallBack(value);
      },
    );
  }
}
