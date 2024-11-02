import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';

class SoupContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF0E3930),
         borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),  // Rounded corner on the top-left
          topRight: Radius.circular(10.0), // Rounded corner on the top-right
        ),// Adjust to match the curved edges
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Matter The Weather, Soup Always Hits \n The Broth Spot!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0, // Adjust to fit the design
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color(0xFF0E3930),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: LogoImage(height: 80, width: 120)
          ),
        ],
      ),
    );
  }
}
