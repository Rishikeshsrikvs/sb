import 'package:flutter/material.dart';

class OrderSummaryAd extends StatelessWidget {
   const OrderSummaryAd ({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF1E3D78), // Updated color based on the image
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Header section with "Today" and dropdown icon
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          SizedBox(height: 20),

          // Circular Progress Indicator + Amount Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Progress Indicator
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 0.85, // 85% as per your image
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF6DC55F), // GreenAccent as per the image
                      ),
                    ),
                    const Text(
                      "85%",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Revenue and Summary Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '₹ 15,000',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                     const  SizedBox(height: 10),
                     const Text(
                        'Demo Content Is Probably One Of The Least Talked About Items In A Designer\'s Toolbox.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                     const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Handle "More Details" click
                        },
                        child: const Text(
                          'More Details',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Delivery Status Boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ensures even spacing
            children: [
              _buildStatusBox("25", "On Delivery", Colors.orange),
              _buildStatusBox("60", "Delivered", Colors.green),
              _buildStatusBox("7", "Canceled", Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  // Status Box Widget
  Widget _buildStatusBox(String count, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Set the background color to blue
        borderRadius: BorderRadius.circular(10), // Optional: adds rounded corners
      ),
      padding: const EdgeInsets.all(8.0), // Padding inside the box
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 20, // Set a proper font size
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 5), // Increased height for better spacing
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14, // Set a proper font size
            ),
          ),
        ],
      ),
    );
  }
}
