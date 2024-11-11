import 'package:flutter/material.dart';
import 'package:soupboys/user/home/profile/ussetting/us_deletesettings.dart';
import 'package:soupboys/user/home/profile/ussetting/us_notificationsettings.dart';



class UsSetting extends StatelessWidget {
  const UsSetting({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(174, 220, 26, 1),
      appBar: AppBar(
        backgroundColor:const Color.fromRGBO(174, 220, 26, 1),
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: [
          ListTile(
            title: const Text(
              'Notification Settings',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
            onTap: () {
               Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsNotificationsettings()), // Replace with your actual profile page widget
                        );
            },
          ),
          Divider(color: Colors.white70, thickness: 0.5),
          ListTile(
            title: const Text(
              'Account Settings',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
            onTap: () {
               Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsDeletesettings()), // Replace with your actual profile page widget
                        );
            },
          ),
          Divider(color: Colors.white70, thickness: 0.5),
        ],
      ),
    );
  }
}
