import 'package:flutter/material.dart';
import 'package:soupboys/shopkeeper/shopdashboard/shopdashboardhome/stat_card.dart';
import 'package:soupboys/shopkeeper/shopdashboard/shopdashboardhome/transaction_summary_card.dart';

class DelHome extends StatelessWidget {
  const DelHome({super.key});

  static const Color darkGreen = Color(0xFF006400);
  static const Color greyColor = Color(0xFF4A4A58);
  static const TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 47,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headerStyle = TextStyle(color: Colors.white);
  static const TextStyle profitStyle = TextStyle(color: Colors.white);
  static const TextStyle deliveryLocationStyle = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDashboardTitle(),
            const SizedBox(height: 20),
            _buildStatCards(),
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 20),
            _buildOrderDetailsContainer(context),
            const SizedBox(height: 30),
            _buildDeliveryLocationContainer(),
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 10),
            TransactionSummaryCard(),
            const SizedBox(height: 10),
            _buildDivider(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardTitle() {
    return const Text(
      'Dashboard',
      style: titleStyle,
    );
  }

  Widget _buildStatCards() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatCard(
          title: 'TOTAL MENU',
          count: '13',
          icon: Icons.menu_book,
          backgroundColor: Colors.purple,
        ),
        StatCard(
          title: 'TOTAL ORDER',
          count: '13',
          icon: Icons.receipt,
          backgroundColor: Colors.orange,
          iconColor: Colors.white70,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 2.0,
      width: double.infinity,
      color: Colors.grey,
    );
  }

  Widget _buildOrderDetailsContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hotel Name', style: headerStyle),
              Text('Location', style: headerStyle),
              Text('Amount', style: headerStyle),
            ],
          ),
          const Divider(color: Colors.white),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Profit Amount:', style: profitStyle),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.green[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/images/delsucess.png', // Replace with your image asset path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Order Successfully Taken',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: const Text('Accept'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    child: const Text('Deny'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryLocationContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Location',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Location Of Delivery Person',
              style: deliveryLocationStyle,
            ),
          ),
        ],
      ),
    );
  }
}