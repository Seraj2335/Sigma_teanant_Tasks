import 'package:flutter/material.dart';

class SecondCheck extends StatefulWidget {
  // final String product;
  // final String name;
  // final String orderNumber;

  // SecondCheck({
  //   required this.name,
  //   required this.orderNumber,
  //   required this.product,
  // });
  @override
  State<SecondCheck> createState() => _SecondCheckState();
}

class _SecondCheckState extends State<SecondCheck> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      width: 350,
      height: 440,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(top: 19, right: 77, left: 73),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Image(image: AssetImage('assets/image 7.png'))),
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text('Product'),
                        SizedBox(
                          width: 35,
                        ),
                        Text('Carbon2'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Name'),
                        SizedBox(
                          width: 35,
                        ),
                        Text('Unit 4'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('2345678-678'),
                        SizedBox(
                          width: 35,
                        ),
                        Text('10 PCS/CTN'),
                      ],
                    ),
                    Text('Available: ' + "10 PCS"),
                    Row(
                      children: [
                        Text('Carton Number'),
                        Container(
                          width: 59,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border:
                                Border.all(width: 1, color: Color(0xffFFA000)),
                          ),
                          child: Center(
                            child: Text(
                              '234567',
                              style: TextStyle(color: Color(0xffFFA000)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 101),
                child: Row(
                  children: [
                    Text(
                      'Second Check',
                      style: TextStyle(color: Color(0xff1AAC0D)),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Checkbox(
                        value: isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        })
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 315, right: 16, top: 11),
              child: IconButton(
                  onPressed: null, icon: Image.asset('assets/X.png')))
        ],
      ),
    );
  }
}
