import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';

class RestaurantMenuScreen extends StatefulWidget {
  @override
  _RestaurantMenuScreenState createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  // A list to track quantities for each item
  List<int> quantities = [1, 1, 1]; // Initialize with quantity 1 for each item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoImage(height: 90, width: 90)
          ],
        ),
        centerTitle: true, // Ensure the title itself is centered
        actions: [
          const SizedBox(width: 48), // Offset for the leading icon to keep it balanced
        ],
      ),
      body: Container(
        color: Colors.green.shade900, // Background color for the SingleChildScrollView
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section with Image and Restaurant Info
              Stack(
                children: [
                  Image.asset(
                    'assets/images/hotelhero.png', // Placeholder image
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add margin on left and right
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Hotel Name",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              const Text("15 - 20 mins • 0.8 km • Avadi"),
                              const SizedBox(height: 4),
                              const Text("South Indian",
                                  style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Row(
                                      children: [
                                        Text(
                                          "4.0",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.star,
                                            color: Colors.white, size: 16),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text("128 ratings"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_offer, color: Colors.pink),
                    SizedBox(width: 8),
                    Text("30% off on the entire menu"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "MENU",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 16),
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Menu Section Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Soups Varieties",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Menu Items List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3, // Sample item count
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Image of Food Item
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/shopmenu.png', // Placeholder food image
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Soup Name",
                                  style: TextStyle(
                                      color: Colors.yellow[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "A healthy and tasty thick creamy soup with tender shredded chicken and veggies.",
                                  // style: TextStyle(color: Colors.grey[700]),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "₹192/-",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Add logic to add item to the cart
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.pink, // Set the background color to pink
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4), // Rounded corners
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10), // Adjust padding for a more comfortable look
                                      ),
                                      child: const Text(
                                        "Add To Cart",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white, // Set the text color to white
                                          fontWeight: FontWeight.bold, // Bold text for emphasis
                                        ),
                                      ),
                                    ),
                                    // Quantity Adjuster
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove,
                                              color: Colors.green),
                                          onPressed: () {
                                            setState(() {
                                              if (quantities[index] > 1) {
                                                quantities[index]--;
                                              }
                                            });
                                          },
                                        ),
                                        Text(
                                          quantities[index].toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add,
                                              color: Colors.green),
                                          onPressed: () {
                                            setState(() {
                                              quantities[index]++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
