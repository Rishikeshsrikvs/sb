// about_page.dart

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:soupboys/shopkeeper/shopprofile/shopabout/shop_language.dart';
import 'package:soupboys/shopkeeper/shopprofile/shopabout/shop_terms.dart';


class ShopAbout extends StatelessWidget {
   const ShopAbout ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('About', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'VERSION 4.25',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Choose Language'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopLanguage()),
                );
              },
            ),
            ListTile(
              title: const Text('Terms Of Service'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopTerms()),
                );
              },
            ),
            ListTile(
              title: const Text('Rate The App'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Show the rating dialog when tapped
                showDialog(
                  context: context,
                  builder: (context) => const RateAppDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RateAppDialog extends StatelessWidget {
   const RateAppDialog ({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Set border radius here
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           const Text(
              'Rate the APP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 30,
                );
              }),
            ),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[900],
                    foregroundColor: Colors.white, // Set text color to white
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:const Text('BACK'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.blue.shade600,
                    foregroundColor: Colors.white, // Set text color to white
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Add submit functionality here if needed
                  },
                  child:const Text('SUBMIT'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
