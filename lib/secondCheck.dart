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
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),
      width: 350,
      height: 440,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 19,
              ),
              Container(
                margin: EdgeInsets.only(left: 73, right: 77),
                child: Image(
                    width: 200,
                    height: 140,
                    image: AssetImage('assets/image 7.png')),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                margin: EdgeInsets.only(left: 79, right: 83),
                child: Image(
                  width: 102,
                  height: 58,
                  image: AssetImage('assets/image 25.png'),
                ),
              ),
              SizedBox(height: 8),
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
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Text('Name',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Text('2345678-678',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 62,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Carton 2',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Text('Unit 4',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Text('10 PCS/CTN',
                                  style: TextStyle(
                                      color: Color(0xff595454),
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text('Available: ' + "10 PCS",
                        style: TextStyle(
                            color: Color(0xff595454),
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Carton Number',
                            style: TextStyle(
                                color: Color(0xffFFA000),
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 23,
                        ),
                        Container(
                          width: 59,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
              SizedBox(
                height: 22,
              ),
              Container(
                margin: EdgeInsets.only(left: 101),
                child: Row(
                  children: [
                    Text(
                      'Second Check',
                      style: TextStyle(
                          color: Color(0xff1AAC0D),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                    ),
                    Container(
                        child: Checkbox(
                            checkColor: Color(0xff1AAC0D),
                            activeColor: Colors.white,
                            side: BorderSide(color: Color(0xff1AAC0D)),
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            }))
                  ],
                ),
              ),
            ],
          ),
          IconButton(
              padding: EdgeInsets.only(left: 245, top: 11, right: 16),
              onPressed: () => Navigator.pop(context),
              icon: Image.asset('assets/X.png'))
        ],
      ),
    );
  }
}
