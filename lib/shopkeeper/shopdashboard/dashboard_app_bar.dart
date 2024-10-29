import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';
import 'package:soupboys/shopkeeper/shopprofile/shop_profile.dart';


class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF15132B),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsets.symmetric( vertical: 10.0), // Add padding here
        child: Padding(
          padding: EdgeInsets.only(top: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserProfile(), // Extracted UserProfile widget
              LogoImage(height: 50, width: 70),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

// Extracted UserProfile Widget
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the existing profile page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>const Profileshop()), // Replace with your actual profile page widget
        );
      },
      child:const Row(
        children: [
          CircleAvatar(
            radius: 24, 
            backgroundColor: Colors.blue,
            child: Icon(Icons.menu, color: Colors.white),
          ),
           SizedBox(width: 20),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Owner Name',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
              ),     
              Text(
                'Hotel Name',
                style: TextStyle(color: Colors.white60,fontSize: 8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
