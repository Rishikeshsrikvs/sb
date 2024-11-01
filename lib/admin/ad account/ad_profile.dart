import 'package:flutter/material.dart';
import 'package:soupboys/admin/ad%20account/ad_accountdetails.dart';
import 'package:soupboys/admin/ad%20account/ad_deliverymange.dart';
import 'package:soupboys/admin/ad%20account/ad_review.dart';
import 'package:soupboys/admin/ad%20account/ad_shopmanage.dart';
import 'package:soupboys/admin/ad%20account/ad_update.dart';
import 'package:soupboys/logo/logo_image.dart';
import 'package:soupboys/shopkeeper/shopprofile/shop_SettingsPage.dart';
import 'delabout/about_page.dart';

class AdProfile extends StatelessWidget {
  const AdProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFB6238),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFB6238),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const LogoImage(height: 70, width: 100),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => AdUpdate()),
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
                        MaterialPageRoute(builder: (context) => const AdAccountdetails()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // 'Others' section
            _buildSectionCard(
              context,
              title: "Others",
              items: [
                _buildListTile(
                  context,
                  icon: Icons.store,
                  title: "ShopKeeper Management",
                  onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdShopmanage()),
                      );
                  },
                ),
                _buildListTile(
                  context,
                  icon: Icons.delivery_dining,
                  title: "Delivery Man Management",
                  onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdDeliverymange()),
                      );
                    // Navigate to Delivery Man Management
                  },
                ),
                _buildListTile(
                  context,
                  icon: Icons.people,
                  title: "User Management",
                  onTap: () {
                    // Navigate to User Management
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 'More' section
            _buildSectionCard(
              context,
              title: "More",
              items: [
                _buildListTile(
                  context,
                  icon: Icons.reviews,
                  title: "Reviews",
                  onTap: () {
                    // Navigate to Reviews
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdReview()),
                      );
                  },
                ),
                _buildListTile(
                  context,
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                ),
                _buildListTile(
                  context,
                  icon: Icons.logout,
                  title: "Log out",
                  onTap: () {
                    _showLogoutConfirmationDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, {required String title, required List<Widget> items}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
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
                  'Log Out From?',
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
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'All Devices',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(color: Colors.white, height: 1),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
