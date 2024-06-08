import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuantitySelector extends StatefulWidget {
  int quantity;
  VoidCallback updateOnTime;
  QuantitySelector({
    super.key,
    required this.quantity,
    required this.updateOnTime,
  });

  @override
  State<QuantitySelector> createState() => QuantitySelectorState();
}

class QuantitySelectorState extends State<QuantitySelector> {
 static int selectedIndexQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.updateOnTime,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndexQuantity == widget.quantity
                  ? Colors.orange
                  : Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              widget.quantity.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );

  }
}
