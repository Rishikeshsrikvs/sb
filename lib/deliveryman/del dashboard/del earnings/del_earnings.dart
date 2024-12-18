import 'package:flutter/material.dart';

class DelEarnings extends StatelessWidget {
  const DelEarnings({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.all(16.0), // Padding inside the container
              decoration: BoxDecoration(
                color:const Color(0xFF660066), // Violet background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEarningsHeader(),
                  const SizedBox(height: 20),
                  _buildEarningsStats(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildOrderListTitle(),
            const SizedBox(height: 10),
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Wrap in a Row and use Spacer to push dropdown to the right
      Row(
        children: [
          const Spacer(), // Pushes the DropdownButton to the right
          DropdownButton<String>(
            value: 'Today',
            dropdownColor: const Color(0xFF15132B),
            items: <String>['Today', 'This Week', 'This Month'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ],
      ),
      const SizedBox(height: 10), // Adds some space before the next row

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 0.90,
                    backgroundColor: Colors.transparent,
                    color: Color(0xFFB2FF00), // Bright green color for the progress
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
                    '80%',
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
          const SizedBox(height: 10),
          const Column(
            children: [
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
        ],
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
      padding:const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            count,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            status,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderListTitle() {
    return const Text(
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
      color:const Color(0xFF1E1C38),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Order ID: $orderId',
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Location: $location',
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Customer Name: $customerName',
                    style:const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Phone Number: $phoneNumber',
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: itemList
                  .map((item) => Text(
                        item,
                        style: const TextStyle(color: Colors.white),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount: ₹ $totalAmount',
                  style:const TextStyle(color: Colors.red, fontSize: 16),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Profit: ₹ $profit',
                    style:const TextStyle(color: Colors.white),
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
