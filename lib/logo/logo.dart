import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    // Calculate font size based on container width (e.g., 5% of the width)
    double fontSize = width * 0.05;

    return Center(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logoSBoys.png',
              width: width,
              height: height,
            ),
            const SizedBox(height: 1),
            Text(
              "SAVOR HEALTH, DELIVERED FAST!",
              style: TextStyle(
                fontSize: fontSize, // Use calculated font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
