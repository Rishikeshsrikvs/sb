import 'package:flutter/material.dart';

class CategoryButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text "WHAT'S ON YOUR MIND?"
            Text(
              "WHAT'S ON YOUR MIND ?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Playfair Display',
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(width: 10), // Space between text and line
            // Gradient Line
            Expanded(
              child: Container(
                height: 2, // Set the height of the line
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.1), // Start of gradient (light)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20), // Space between text and buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // VEG Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFAEDC1A),
                fixedSize: Size(180, 50), // Set a fixed size for both buttons
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    right:0,
                    bottom: 0, // Space from the right
                    child: Container(
                      height: 24, // Set the height for the image
                      width: 24,  // Set the width for the image
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/veg.png'), // Background image for VEG
                          fit: BoxFit.contain, // Image scaled to fit
                          alignment: Alignment.centerRight, // Positioned to the right
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'VEG',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // NON-VEG Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0F4D44),
                fixedSize: Size(180, 50), // Set a fixed size for both buttons
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 0, // Space from the right
                    bottom: 0, // Align the image to the right
                    child: Container(
                      height: 50, // Set the height for the image
                      width: 50, // Set the width for the image
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/noveg.png'), // Background image for NON-VEG
                          fit: BoxFit.contain, // Image scaled to fit
                          alignment: Alignment.bottomRight, // Positioned to the right
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'NON-VEG',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
