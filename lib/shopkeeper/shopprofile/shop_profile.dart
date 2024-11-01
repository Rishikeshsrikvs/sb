import 'package:flutter/material.dart';

import 'package:soupboys/logo/logo_image.dart';
import 'package:soupboys/shopkeeper/shopprofile/shop_SettingsPage.dart';
import 'package:soupboys/shopkeeper/shopprofile/shop_update.dart';

import 'shop_AccountDetails.dart';
import 'shop_history.dart';
import 'shop_menumange.dart';
import 'shopabout/about_page.dart';

class Profileshop extends StatelessWidget {
  const Profileshop ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white), // Exit icon
            onPressed: () {
              Navigator.pop(context); // Example action: go back to previous screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
           const SizedBox(height: 20),
            const LogoImage(height: 70, width: 100),
            const SizedBox(height: 16), // Space between logo and profile card
            // User profile section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0), // Padding inside the profile card
                    child:Row(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the profile page
                          Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) =>  ShopUpdate()),
                );
          
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "USERNAME",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("username@gmail.com", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text("Account Details"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountDetailsScreen()), // Replace with your actual profile page widget
        );
                    },
                  ),
                ],
              ),
            ),
             const SizedBox(height: 20),
            // "Others" section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.menu, color: Colors.red),
                    title: const Text("Menu Management"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const MenuManagementPage()), // Replace with your actual profile page widget
                      );
                    },
                  ),
                   const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.payment, color: Colors.red),
                    title: const Text("Payment History"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentHistoryScreen()), // Replace with your actual profile page widget
                        );// Handle navigation
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // "More" section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.info),
                    title: const Text("About"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ShopAboutPage()), // Replace with your actual profile page widget
                        );
                    },
                  ),
                   const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsPage()), // Replace with your actual profile page widget
                        );
                    },
                  ),
                 const  Divider(height: 1),
                  ListTile(
                    leading:  const Icon(Icons.logout),
                    title: const Text("Log out"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showLogoutConfirmationDialog(context); // Show the custom logout dialog
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          backgroundColor: Colors.purple.shade900,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Log Out From ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    // Handle logout from current device
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Current Device',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(color: Colors.white, height: 1),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    // Handle logout from all devices
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'All Device',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(color: Colors.white, height: 1),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
