import 'package:flutter/material.dart';

class Basmallah extends StatelessWidget {
  final int index;

  const Basmallah({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      child: Padding(
        padding: EdgeInsets.only(
          left: screenSize.width * 0.2,
          right: screenSize.width * 0.2,
          top: 8,
          bottom: 2,
        ),
        child: Image.asset(
          "assets/images/Basmala.png",
          color: Colors.black,
          width: screenSize.width * 0.4,
        ),
      ),
    );
  }
}