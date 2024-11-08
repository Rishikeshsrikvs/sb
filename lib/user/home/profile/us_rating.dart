import 'package:flutter/material.dart';

class UsRating extends StatelessWidget {
  const UsRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 169, 252, 37), // Light green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile image with shadow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: const Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 120,
                backgroundImage:
                    AssetImage('assets/man1.png'), // Replace with your image
              ),
            ),
            const SizedBox(height: 90),
            // Order status
            const Text(
              'Order Completed',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Prompt for rating
            const Text(
              'Rate The Hotel Dishes',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            // Star rating row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < 3
                      ? const Color.fromARGB(255, 241, 34, 20)
                      : Colors.grey, // Change rating accordingly
                  size: 30,
                );
              }),
            ),
            const SizedBox(height: 30),
            // Feedback text field with pencil icon and border
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Leave feedback',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon:
                      const Icon(Icons.edit, color: Colors.black54), // Pencil icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(137, 0, 0, 0), // Border color
                      width: 2, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black54, // Border color when not focused
                      width: 2, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black, // Border color when focused
                      width: 2, // Border width
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 35, 19),
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Lightly rounded button
                ),
              ),
              onPressed: () {
                // Handle submit action
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
