import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';
import 'package:soupboys/user/home/profile/address_screen.dart';
import 'package:soupboys/user/home/profile/us_profileupdate.dart';
import 'package:soupboys/user/home/profile/usabout/us_about.dart';
import 'package:soupboys/user/home/profile/usfav/us_favorders.dart';
import 'package:soupboys/user/home/profile/usorder/us_urorder.dart';
import 'package:soupboys/user/home/profile/ussetting/us_setting.dart';

class UsDrawer extends StatelessWidget {
  const UsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFB2FF59), // Light green background color
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Profile Header with navigation to ProfileUpdatePage
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsProfileupdate()),
                );
              },
              child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFB2FF59), // Light green background for header
                ),
                accountName: Text(
                  'USERNAME',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                accountEmail: Text('username@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    'U',
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
            ),
            // Address Book
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Address book'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddressScreen()),
                );
              },
            ),
            const Divider(),
            // Orders Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Orders', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Your Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsUrorder()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsFavorders()),
                );
              },
            ),
            const Divider(),
            // More Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('More', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsAbout()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsSetting()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
            const SizedBox(height: 20),
            // Logo at Bottom
            const Align(
              alignment: Alignment.bottomCenter,
              child: LogoImage(height: 80, width: 120),
            ),
          ],
        ),
      ),
    );
  }

  // Logout confirmation dialog
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
