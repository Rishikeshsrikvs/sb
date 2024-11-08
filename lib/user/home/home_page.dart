import 'package:flutter/material.dart';
import 'package:soupboys/user/cart/us_cart.dart';
import 'package:soupboys/user/history_widgets/history_screen.dart';
import 'package:soupboys/user/home/fav/favourites_page.dart';
import 'package:soupboys/user/home/us_home.dart';
import 'package:soupboys/user/home/widgets/bottom_navigation_widget.dart';
import 'widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // To track the selected tab index

  // List of pages for each tab
  final List<Widget> _pages = [
    const OrderHistoryScreen(), 
    const UsHome(),        // Home page
    FavoritesScreen(),     // Favorites page
    
    CartScreen()   ,    // Settings page (for example purposes)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _selectedIndex, // Display the selected page
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _selectedIndex, // Pass the current index
        onTap: _onItemTapped,         // Pass the function to handle taps
      ),
    );
  }
}
