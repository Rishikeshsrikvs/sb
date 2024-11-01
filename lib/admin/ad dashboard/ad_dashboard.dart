import 'package:flutter/material.dart';
import 'package:soupboys/admin/ad%20dashboard/ad%20approval/ad%20approval.dart';
import 'package:soupboys/admin/ad%20dashboard/ad%20order/ad_orders.dart';
import 'package:soupboys/admin/ad%20dashboard/ad_appbar.dart';
import 'package:soupboys/admin/ad%20dashboard/ad_home.dart';
import 'package:soupboys/admin/ad%20dashboard/ad_navbar.dart';



class AdDashboard extends StatefulWidget {
 const AdDashboard({super.key});
    @override
  State<AdDashboard> createState() {
    return _AdDashboard();
  }
}

class _AdDashboard extends State<AdDashboard> {
  int _selectedIndex = 0;

  // List of pages corresponding to each tab
  final List<Widget> _pages = [
   
      const AdHome (),
      const  AdOrders(),
    ApprovalScreen(),
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
        appBar: const AdAppbar(), // Custom AppBar
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: AdNavbar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
