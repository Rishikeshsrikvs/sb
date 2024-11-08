// ignore: file_names
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assest/img37.png', // Replace with your image
              height: 400,
            ),
            const SizedBox(height: 20),
            const Text(
              'No internet Connection',
              style: TextStyle(
                fontSize: 22,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your internet connection is currently not available.\nPlease check or try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 155, 152, 152)),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 163, 25),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Light curved border radius
                ),
              ),
              onPressed: () {
                // Handle try again action
              },
              child: const Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
