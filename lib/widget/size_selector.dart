import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:am_shops/model/api_model.dart';

class SizeSelector extends StatefulWidget {
  String selectedSize;
  VoidCallback updateOnTime;
  int checkSizeCondition;
  SizeSelector(
      {super.key,
      required this.checkSizeCondition,
      required this.selectedSize,
      required this.updateOnTime,
      });

  @override
  State<SizeSelector> createState() => SizeSelectorState();
}

class SizeSelectorState extends State<SizeSelector> {
 static int selectedIndexSize = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.updateOnTime,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndexSize == widget.checkSizeCondition
                  ? Colors.orange
                  : Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              widget.selectedSize,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
