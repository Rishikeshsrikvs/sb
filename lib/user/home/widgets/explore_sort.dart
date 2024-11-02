import 'package:flutter/material.dart';

class ExploreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text "WHAT'S ON YOUR MIND?"
            Text(
              "RESTAURANTS TO EXPLORE",
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
          SizedBox(height: 8),
          // Horizontal line to the right of the title
          Container(
            width: 60,
            height: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: 20),
          // Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Sort Button with Icon
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.sort, size: 16), // Adjust icon size
                  label: Text(
                    'Sort',
                    style: TextStyle(fontSize: 10), // Smaller font size
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.black),
                    minimumSize: Size(0, 40), // Minimum height for buttons
                  ),
                ),
              ),
              SizedBox(width: 8), // Space between buttons
              // Great Offers Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Great Offers',
                    style: TextStyle(fontSize: 10), // Smaller font size
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.black),
                    minimumSize: Size(0, 40), // Minimum height for buttons
                  ),
                ),
              ),
              SizedBox(width: 8), // Space between buttons
              // Top Ratings Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Top Ratings',
                    style: TextStyle(fontSize: 10,), // Smaller font size
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.black),
                    minimumSize: Size(0, 40), // Minimum height for buttons
                  ),
                ),
              ),
              SizedBox(width: 8), // Space between buttons
              // Fast Delivery Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Fast Delivery',
                    style: TextStyle(fontSize: 10), // Smaller font size
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.black),
                    minimumSize: Size(0, 40), // Minimum height for buttons
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Subtitle
          Text(
            'All Restaurants Around You',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
