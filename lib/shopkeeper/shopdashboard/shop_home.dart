import 'package:flutter/material.dart';
import 'package:soupboys/shopkeeper/shopdashboard/shopdashboardhome/order_summary_card.dart';
import 'package:soupboys/shopkeeper/shopdashboard/shopdashboardhome/stat_card.dart';
import 'package:soupboys/shopkeeper/shopdashboard/shopdashboardhome/stat_card2.dart';
import 'package:soupboys/shopkeeper/shopdashboard/shopdashboardhome/transaction_summary_card.dart';
 // Import your TransactionSummaryCard widget

class ShopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDashboardTitle(),
            SizedBox(height: 20),
            _buildStatCards(),
            SizedBox(height: 20),
            _buildTotalRevenueCard(),
            SizedBox(height: 20),
            _buildDivider(),
            SizedBox(height: 20),
            _buildOrderSummaryTitle(),
            SizedBox(height: 10),
            OrderSummaryCard(),
            SizedBox(height: 10),
            _buildDivider(),
            SizedBox(height: 10),
            TransactionSummaryCard(),
            SizedBox(height: 10),
            _buildDivider(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardTitle() {
    return Text(
      'Dashboard',
      style: TextStyle(
        color: Colors.white,
        fontSize: 47,
        fontWeight: FontWeight.bold,
      ),
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

  Widget _buildTotalRevenueCard() {
    return const StatCard2(
      title: 'TOTAL REVENUE',
      count: '₹ 15,000',
      icon: Icons.attach_money,
      backgroundColor: Colors.yellow,
      textColor: Colors.red,
      iconColor: Colors.red,
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 2.0,
      width: double.infinity,
      color: Colors.grey,
    );
  }

  Widget _buildOrderSummaryTitle() {
    return const Text(
      'Order Summary',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
