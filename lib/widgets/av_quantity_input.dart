import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvailableQuantityInput extends StatelessWidget {
  final int quantityAv;
  AvailableQuantityInput({
    required this.quantityAv,
  });

  @override
  Widget build(BuildContext context) {
    var quantityAvailable = quantityAv;
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              width: 1, color: Colors.black)),
      child: Center(
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
              border: InputBorder.none),
          textAlign: TextAlign.center,
          cursorColor: Colors.black,
          initialValue: quantityAvailable.toString(),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
