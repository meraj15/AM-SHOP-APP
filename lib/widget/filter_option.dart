import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {
  final String text;
  final double width;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterOption({
    required this.text,
    required this.width,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          height: 35,
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.orange : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
