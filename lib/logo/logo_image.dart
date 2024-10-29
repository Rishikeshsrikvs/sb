import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
 

    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              'assets/images/logoSBoys.png',
              width: width,
              height: height,
            ),
          ],
        ),
      ),
    );
  }
}
