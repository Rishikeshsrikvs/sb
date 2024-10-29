import 'package:flutter/material.dart';
import 'package:soupboys/shopkeeper/shopdashboard/bottom_nav_bar.dart';
import 'dashboard_app_bar.dart';
import 'shop_home.dart';
import 'shopdashboardhome/shopearning/shop_earnings.dart';
import 'shoporder/shop_orders.dart';
// import 'orders_page.dart';
// import 'earnings_page.dart';

class DashboardPage extends StatefulWidget {
 const DashboardPage({super.key});
    @override
  State<DashboardPage> createState() {
    return _DashboardPage();
  }
}

class _DashboardPage extends State<DashboardPage> {
  int _selectedIndex = 0;

  // List of pages corresponding to each tab
  final List<Widget> _pages = [
    ShopHome(),
    const OrdersContainer(),
   const EarningsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF15132B),
        appBar: const DashboardAppBar(), // Custom AppBar
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
