import 'package:flutter/material.dart';

class TransactionSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section with "Transactions Summary" and dropdown button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions Summary',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF536DFE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      'This Month',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Circle indicators for successful and unsuccessful orders
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCircleIndicator("585", "Successful Orders", Colors.green),
              _buildCircleIndicator("123", "Unsuccessful Orders", Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build the circular progress indicators
  Widget _buildCircleIndicator(String count, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 4),
          ),
          child: Center(
            child: Text(
              count,
              style: TextStyle(
                color: color,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
