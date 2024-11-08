import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('Delivery to'),
        actions: [
          TextButton(
            onPressed: () {
              // Implement location change
            },
            child: const Text(
              'AVADI',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Cart Items List
          Expanded(
            child: ListView(
              children: [
                CartItemWidget(),
                CartItemWidget(),
                CartItemWidget(),
              ],
            ),
          ),
          // Coupon Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.green[100],
              child: ListTile(
                leading: Icon(Icons.local_offer, color: Colors.red),
                title: const Text(
                  'Save Extra By Applying Coupons On Every Order',
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter coupon code',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Apply coupon code
                      },
                      child: const Text('APPLY'),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Order Summary
          OrderSummarySection(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Place order action
                  },
                  style: ElevatedButton.styleFrom(),
                  child: const Text(
                    'PLACE ORDER',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'GRAND TOTAL: ₹400',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Cart Item Widget
class CartItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/menuimage.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Item Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '₹200',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                // Decrease quantity
                              },
                            ),
                            const Text('1'), // Quantity value
                            IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                // Increase quantity
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Remove item
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Order Summary Section Widget
class OrderSummarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryTile(icon: Icons.delivery_dining, title: 'Delivery in 24 mins'),
        SummaryTile(icon: Icons.home, title: 'Delivery at Home'),
        SummaryTile(icon: Icons.person, title: 'Name, Phone Number'),
        SummaryTile(
          icon: Icons.receipt,
          title: 'Total Bill - ₹400',
          trailing: Text(
            '₹400',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

// Summary Tile Widget
class SummaryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;

  const SummaryTile({required this.icon, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title),
        trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to respective screens or perform actions
        },
      ),
    );
  }
}
