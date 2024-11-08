import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';
import 'package:soupboys/user/home/profile/address_screen.dart';
import 'package:soupboys/user/home/profile/us_profileupdate.dart';
import 'package:soupboys/user/home/profile/usabout/us_about.dart';
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
                  MaterialPageRoute(builder: (context) =>UsProfileupdate()),
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
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite Orders'),
              onTap: () {},
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
              onTap: () {},
            ),
            const Spacer(),
            // Logo at Bottom
            const LogoImage(height: 80, width: 120)
          ],
        ),
      ),
    );
  }
}

// Example ProfileUpdatePage

