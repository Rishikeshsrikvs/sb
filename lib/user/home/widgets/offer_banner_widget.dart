import 'package:flutter/material.dart';

class OfferBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
     decoration: BoxDecoration(
        color: Color(0xFFFB7827), // Set color to #FB7827
        borderRadius: BorderRadius.circular(7), // Add border radius
      ),
      child: Center(
        child: Text(
          'Offer & Festival Special',
          style: TextStyle(color: Colors.white, fontSize: 15, fontFamily:"Playfair Display"),
        ),
      ),
    );
  }
}
