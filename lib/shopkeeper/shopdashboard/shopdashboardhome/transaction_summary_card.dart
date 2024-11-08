import 'package:flutter/material.dart';

class TransactionSummaryCard extends StatefulWidget {
  @override
  _TransactionSummaryCardState createState() => _TransactionSummaryCardState();
}

class _TransactionSummaryCardState extends State<TransactionSummaryCard> {
  String selectedPeriod = 'This Month';
  int successfulOrders = 585;
  int unsuccessfulOrders = 123;

  // This function updates the transaction numbers based on the selected period
  void _updateTransactionCounts(String period) {
    setState(() {
      selectedPeriod = period;
      if (period == 'This Month') {
        successfulOrders = 585;
        unsuccessfulOrders = 123;
      } else if (period == 'Last 3 Months') {
        successfulOrders = 1800;
        unsuccessfulOrders = 450;
      } else if (period == 'Last 6 Months') {
        successfulOrders = 3200;
        unsuccessfulOrders = 780;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Background color for the card
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section with "Transactions Summary" and dropdown button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transactions Summary',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF536DFE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: selectedPeriod,
                  dropdownColor: const Color(0xFF1E3D78),
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  underline: Container(), // Removes the default underline
                  style: const TextStyle(color: Colors.white),
                  items: <String>['This Month', 'Last 3 Months', 'Last 6 Months']
                      .map((String period) {
                    return DropdownMenuItem<String>(
                      value: period,
                      child: Text(
                        period,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      _updateTransactionCounts(newValue);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Circle indicators for successful and unsuccessful orders
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCircleIndicator(successfulOrders.toString(), "Successful Orders", Colors.green),
              _buildCircleIndicator(unsuccessfulOrders.toString(), "Unsuccessful Orders", Colors.red),
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
          width: 150,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(60),
            border: Border.all(
              color: Colors.grey.withOpacity(0.4),
              width: 2,
            ),
          ),
          child: Center(
            child: Container(
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
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
