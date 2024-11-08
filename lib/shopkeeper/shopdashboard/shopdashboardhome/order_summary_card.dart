import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3D78), // Background color for the card
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEarningsHeader(),
          const SizedBox(height: 20),
          _buildProgressIndicatorSection(),
          const SizedBox(height: 20),
          _buildDeliveryStatusRow(),
        ],
      ),
    );
  }

  Widget _buildEarningsHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown Button for Date Range
        Row(
          children: [
            const Spacer(),
            DropdownButton<String>(
              value: 'Today',
              dropdownColor: const Color(0xFF15132B),
              items: <String>['Today', 'This Week', 'This Month']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (value) {},
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildProgressIndicatorSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Circular Progress Indicator
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: 0.85,
                  backgroundColor: Colors.grey,
                  color: Color(0xFFB2FF00), // Bright green color for progress
                  strokeWidth: 10,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  '85%',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Earnings Information
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '₹ 15,000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total Earnings for Today',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryStatusRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatusBox("25", "On Delivery", Colors.orange),
        _buildStatusBox("60", "Delivered", Colors.green),
        _buildStatusBox("7", "Canceled", Colors.red),
      ],
    );
  }

  // Status Box Widget
  Widget _buildStatusBox(String count, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 41, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
