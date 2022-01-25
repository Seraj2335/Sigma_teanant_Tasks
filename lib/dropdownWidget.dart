import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      icon: Icon(
        Icons.arrow_drop_down,
        color: Color(0xffFFA000),
      ),
      items: [
        DropdownMenuItem(
          child: Text('Value1'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Value2'),
          value: 2,
        )
      ],
      hint: Text(
        'Assignee',
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xff595454)),
      ),
      onChanged: (int? value) {
        setState(() {
          _value = value!;
        });
      },
    );
  }
}
