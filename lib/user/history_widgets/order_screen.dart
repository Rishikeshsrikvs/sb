import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define screen width and height based on the current context
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: const Color.fromARGB(255, 120, 211, 16),
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: const Color.fromARGB(
           255, 120, 211, 16), // Full-screen green background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by restaurant or dish',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white, // White background for search bar
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assest/img55.png', // Ensure this path is correct
              width: screenWidth * 0.9, // Set width to 90% of the screen width
              height:
                  screenHeight * 0.4, // Set height to 40% of the screen height
              fit: BoxFit
                  .cover, // Ensures the image covers the entire widget area
            ),
            const SizedBox(height: 40),
            const Text(
              'No orders yet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(
                    255, 255, 17, 0), // Set the desired text color
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Hit the order button down below to create an order',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('ORDER NOW'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 248, 3, 3),
                foregroundColor: Colors.white, // Set text color
                minimumSize: Size(300, 50), // Set width and height of button
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
     
    );
  }
}
