import 'package:flutter/material.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEarningsHeader(),
            SizedBox(height: 20),
            _buildEarningsStats(),
            SizedBox(height: 20),
            _buildOrderListTitle(),
            SizedBox(height: 10),
            _buildOrderCard(
              orderId: '#5343435',
              customerName: 'M S Gandhi',
              phoneNumber: '2356891470',
              location: 'Address',
              itemList: ['Item List', 'Item List'],
              totalAmount: '400',
              profit: '400',
            ),
            _buildOrderCard(
              orderId: '#5343435',
              customerName: 'M S Gandhi',
              phoneNumber: '2356891470',
              location: 'Address',
              itemList: ['Item List', 'Item List'],
              totalAmount: '400',
              profit: '400',
            ),
            _buildOrderCard(
              orderId: '#5343435',
              customerName: 'M S Gandhi',
              phoneNumber: '2356891470',
              location: 'Address',
              itemList: ['Item List', 'Item List'],
              totalAmount: '400',
              profit: '400',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Circular Progress Indicator with percentage
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularProgressIndicator(
              value: 0.85, // 85%
              backgroundColor: Colors.blue[100],
              color: Colors.blue,
              strokeWidth: 8,
            ),
            SizedBox(height: 10),
            Text(
              '₹ 15,000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Total Earnings for Today',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        // Dropdown button for selecting time (Today)
        DropdownButton<String>(
          value: 'Today',
          dropdownColor: Color(0xFF15132B),
          items: <String>['Today', 'This Week', 'This Month']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildEarningsStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatusCard('25', 'On Delivery', Colors.orange),
        _buildStatusCard('60', 'Delivered', Colors.green),
        _buildStatusCard('7', 'Cancelled', Colors.red),
      ],
    );
  }

  Widget _buildStatusCard(String count, String status, Color color) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            status,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderListTitle() {
    return Text(
      'Order List',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildOrderCard({
    required String orderId,
    required String customerName,
    required String phoneNumber,
    required String location,
    required List<String> itemList,
    required String totalAmount,
    required String profit,
  }) {
    return Card(
      color: Color(0xFF1E1C38),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(  // Wrap with Expanded
                  child: Text(
                    'Order ID: $orderId',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
                Expanded(  // Wrap with Expanded
                  child: Text(
                    'Location: $location',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Customer Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(  // Wrap with Expanded
                  child: Text(
                    'Customer Name: $customerName',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
                Expanded(  // Wrap with Expanded
                  child: Text(
                    'Phone Number: $phoneNumber',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Item List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: itemList
                  .map((item) => Text(
                        item,
                        style: TextStyle(color: Colors.white),
                      ))
                  .toList(),
            ),
            SizedBox(height: 10),
            // Total Amount and Profit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount: ₹ $totalAmount',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Profit: ₹ $profit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
