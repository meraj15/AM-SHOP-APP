import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpinKitFadingCircle(
          color: Colors.orange,
          size: 80.0,
        ),
         SizedBox(
          height: 10,
        ),
         Text(
          "Loading...",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
