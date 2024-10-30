import 'package:flutter/material.dart';

import 'package:soupboys/logo/logo_image.dart';
import 'package:soupboys/shopkeeper/shoplogin/Shopkeeper_login.dart';

class Welcomescreen extends StatefulWidget {
  @override
  _WelcomescreenState createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                buildPage(
                  
                  title: 'Order from your favourite stores or vendors',
                  contentImagePath: 'assets/images/wel1.png',
                ),
                buildPage(
                
                  title: 'Choose from a wide range of delicious meals',
                  contentImagePath: 'assets/images/wel2.png', // Replace with path to image with foods
                ),
                buildPage(
                 
                  title: 'Enjoy instant delivery and payment',
                  contentImagePath: 'assets/images/wel3.png', // Replace with path to image with delivery person
                ),
              ],
            ),
          ),
          // Pagination indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3, // Number of pages
              (index) => buildIndicator(index == _currentPage),
            ),
          ),
          const SizedBox(height: 24),
          // Next button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) =>  ShopkeeperLoginPage()),
                );// Navigate to next screen or perform another action
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Updated property
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                _currentPage < 2 ? 'Next' : 'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          // Skip button
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) =>  ShopkeeperLoginPage()),
                ); // Handle skip action
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // Function to build each page
  Widget buildPage({
   
    required String title,
    required String contentImagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          LogoImage(height:60, width: 60), // Logo at the top
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Image.asset(contentImagePath, height: 300), // Main content image
          Spacer(),
        ],
      ),
    );
  }

  // Function to build the pagination indicator
  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
