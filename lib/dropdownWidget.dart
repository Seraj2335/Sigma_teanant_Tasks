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
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.amber,
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
      hint: Text('Assignee'),
      onChanged: (int? value) {
        setState(() {
          _value = value!;
        });
      },
    );
  }
}
