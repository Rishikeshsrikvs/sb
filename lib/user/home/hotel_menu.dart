import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';


class RestaurantMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     LogoImage(height: 90, width: 90)
    ],
  ),
  centerTitle: true, // Ensure the title itself is centered
  actions: [
    SizedBox(width: 48), // Offset for the leading icon to keep it balanced
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
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Add margin on left and right
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hotel Name",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text("15 - 20 mins • 0.8 km • Avadi"),
            SizedBox(height: 4),
            Text("South Indian",
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
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
                SizedBox(width: 8),
                Text("128 ratings"),
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  
                ),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_offer, color: Colors.pink),
                    SizedBox(width: 8),
                    Text("30% off on the entire menu"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text("MENU" ,style: TextStyle(color: Colors.white,
              fontSize: 20),
              ),
              const SizedBox(height: 16),
              // Discount Banner
              
              const SizedBox(height: 16),
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3, // Sample item count
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.all(12),
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
                          SizedBox(width: 12),
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
                                SizedBox(height: 4),
                                Text(
                                  "A healthy and tasty thick creamy soup with tender shredded chicken and veggies.",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹192/- Add To Cart",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Quantity Adjuster
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove,
                                              color: Colors.green),
                                          onPressed: () {},
                                        ),
                                        Text("1",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        IconButton(
                                          icon: Icon(Icons.add,
                                              color: Colors.green),
                                          onPressed: () {},
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
