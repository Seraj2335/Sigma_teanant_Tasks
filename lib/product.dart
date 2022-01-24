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
      'model': "Carbon 25"
    };
    return Row(children: [
      Image(
          width: 50,
          height: 50,
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg')),
      SizedBox(
        width: 24,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(list['productName']),
          SizedBox(
            height: 2,
          ),
          Text(list['id']),
          SizedBox(
            height: 2,
          ),
          Text(
            list['model'],
            style: TextStyle(color: Colors.amber),
          ),
          SizedBox(
            height: 2,
          )
        ],
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        children: [Text('Available'), Text('3PCs')],
      ),
      SizedBox(
        width: 15,
      ),
      Checkbox(
          value: isChecked,
          onChanged: (newValue) {
            setState(() {
              isChecked = newValue!;
            });
          })
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
