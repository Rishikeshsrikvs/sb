import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo.dart';


import 'package:soupboys/splashscreen/welcomescreen.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(height: 400, width: 400), // Use const for Logo if height and width are known at compile-time
            const SizedBox(height: 250),
            TextButton(
              onPressed: () {
                // Use context from the build method
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) =>  Welcomescreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(174, 220, 26, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(75, 8, 75, 8),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
