import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> list = {
      'productName': 'Product Name',
      'id': "657890-9",
      'model': "Carton #25"
    };
    return Row(children: [
      Container(
        width: 50,
        height: 50,
        color: Color(0xffF7A51C),
      ),
      SizedBox(
        width: 19,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(list['productName'],
              style: TextStyle(
                  color: Color(0xff595454),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat')),
          SizedBox(
            height: 1,
          ),
          Text(list['id'],
              style: TextStyle(
                  color: Color(0xff595454),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat')),
          SizedBox(
            height: 1,
          ),
          Text(list['model'],
              style: TextStyle(
                  color: Color(0xffffaa00),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat')),
          SizedBox(
            height: 1,
          )
        ],
      ),
      SizedBox(
        width: 24,
      ),
      Column(
        children: [
          Text('Available',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff595454))),
          Text('3PCS',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff595454)))
        ],
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        width: 30,
        height: 30,
        child: Checkbox(
            value: isChecked,
            onChanged: (newValue) {
              setState(() {
                isChecked = newValue!;
              });
            }),
      )
    ]);
  }
}

// class CheckBoxWidget extends StatelessWidget {
//   final bool isChecked;
//   final Function checkboxCallBack;
//   CheckBoxWidget({required this.checkboxCallBack, required this.isChecked});
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         checkColor: Colors.green,
//         value: isChecked,
//         onChanged: checkboxCallBack());
//   }
// }
