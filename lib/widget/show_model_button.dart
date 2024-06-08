import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowModelButton extends StatelessWidget {
  double height;
  String title;
  ShowModelButton({
    super.key,
    required this.height,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.orange,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
