import 'package:flutter/material.dart';
import 'package:soupboys/deliveryman/del%20dashboard/del%20earnings/del_earnings.dart';
import 'package:soupboys/deliveryman/del%20dashboard/del%20order/del_orders.dart';
import 'package:soupboys/deliveryman/del%20dashboard/del_appbar.dart';
import 'package:soupboys/deliveryman/del%20dashboard/del_home.dart';
import 'package:soupboys/deliveryman/del%20dashboard/del_navbar.dart';


class DelDashboard extends StatefulWidget {
 const DelDashboard({super.key});
    @override
  State<DelDashboard> createState() {
    return _DelDashboard();
  }
}

class _DelDashboard extends State<DelDashboard> {
  int _selectedIndex = 0;

  // List of pages corresponding to each tab
  final List<Widget> _pages = [
   
   const DelHome (),
    const DelOrders(),
    const DelEarnings(),
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
        appBar: const DelAppbar(), // Custom AppBar
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: DelNavbar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
