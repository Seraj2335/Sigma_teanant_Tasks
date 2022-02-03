import 'package:flutter/material.dart';

class StoreDetails extends StatefulWidget {
  final snapshot;
  int value;

  StoreDetails({required this.snapshot, required this.value});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

int? selectedValue;

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.15,
            top: 9,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order No: ' + widget.snapshot.data!.tempOrder.tempOrderInvoiceNo,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 6,
              ),
              Text('Store Name: ' + widget.snapshot.data!.tempOrder.store,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 6,
              ),
              Text('Order Date: ' + widget.snapshot.data!.tempOrder.date.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 6,
              ),
              Text('Marks: ' + 'APT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.002,
        ),
        ListTile(
            contentPadding: EdgeInsets.only(left: 0, right: 0),
            leading: Container(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Order Details:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            trailing: widget.value == 4
                ? Container(
                    padding: EdgeInsets.only(left: 11),
                    width: 106,
                    height: 29,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black54),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: DropdownButton(
                        underline: Container(),
                        icon: Container(
                            width: 14,
                            height: 11,
                            child: Image.asset('assets/Polygon 7.png')),
                        items: [
                          DropdownMenuItem(value: 1, child: Text('1')),
                          DropdownMenuItem(value: 2, child: Text('2')),
                          DropdownMenuItem(value: 3, child: Text('3')),
                        ],
                        hint: Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            'Assignee',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        onChanged: (int? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        }))
                : Text(
                    'Assignee: Santosh',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )),
      ]),
    );
  }
}
