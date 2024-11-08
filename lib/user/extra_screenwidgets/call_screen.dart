// ignore: file_names
import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 176, 240, 76), // Light green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile image
            const CircleAvatar(
              radius: 100,
              backgroundImage:
                  AssetImage('assest/man1.png'), // Replace with your image
            ),
            const SizedBox(height: 10),
            // User's name
            const Text(
              'M S Gandhi',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            // Call status
            const Text(
              'Ringing...',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 150),
            // Call options (Remind Me, Message)
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.alarm, size: 30, color: Colors.black),
                    SizedBox(height: 5),
                    Text('Remind me', style: TextStyle(color: Colors.black54)),
                  ],
                ),
                SizedBox(width: 60),
                Column(
                  children: [
                    Icon(Icons.message, size: 30, color: Colors.black),
                    SizedBox(height: 5),
                    Text('Message', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Slide to answer and Deny buttons
            Container(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular container for the call icon
                  Container(
                    width: 80, // Width of the circular container
                    height: 30, // Height of the circular container
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Colors.green[10], // Background color for the circle
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: const Icon(Icons.call,
                        color: Colors.green,
                        size: 30), // Call icon inside the circular container
                  ),
                  const SizedBox(width: 20), // Adjust spacing as needed
                  const Text(
                    'Slide to answer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18, // Set the desired font size here
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Deny button
            // Deny button
            TextButton(
              onPressed: () {
                // Handle Deny action
              },
              child: const Text(
                'Deny',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Set font weight to bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
