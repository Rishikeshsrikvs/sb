import 'package:flutter/material.dart';

class UsFavorders extends StatelessWidget {
  const UsFavorders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB2FF59), // Light green background
      appBar: AppBar(
        backgroundColor: const Color(0xFFB2FF59),
        elevation: 0,
        title: const Text(
          'Your Favorite Orders',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search by restaurant or dish',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Order cards
            Expanded(
              child: ListView(
                children: [
                  buildOrderCard(
                    hotelName: 'Hotel Name',
                    location: 'Hotel Location',
                    menuLink: 'View Menu',
                    orderDate: '11 Sep, 7:52 PM',
                    amount: '₹613.88',
                    isDelivered: true,
                    rating: 3,
                    feedbackLink: 'View Your Feedback',
                    canReorder: true,
                  ),
                  buildOrderCard(
                    hotelName: 'Hotel Name',
                    location: 'Hotel Location',
                    menuLink: 'View Menu',
                    orderDate: '11 Sep, 7:52 PM',
                    amount: '₹353.88',
                    isDelivered: true,
                    rating: null,
                    feedbackLink: null,
                    canReorder: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderCard({
    required String hotelName,
    required String location,
    required String menuLink,
    required String orderDate,
    required String amount,
    required bool isDelivered,
    int? rating,
    String? feedbackLink,
    bool canReorder = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Info
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Color(0xFF004D40), // Dark green background
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 20,
                  child: Icon(Icons.image, color: Colors.grey[600]),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotelName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text(location, style: const TextStyle(color: Colors.white)),
                      Text(menuLink, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 10),
                    Icon(Icons.tune, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          // Order Items and Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Count         Item Name"),
                const Text("Count         Item Name"),
                const Divider(),
                Text(
                  'Order placed on $orderDate',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  isDelivered ? 'Delivered' : 'Currently Not Delivered',
                  style: TextStyle(
                    color: isDelivered ? Colors.black : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Amount: $amount', style: const TextStyle(fontWeight: FontWeight.bold)),
                if (rating != null) ...[
                  const SizedBox(height: 8),
                  Text('You Rated $rating ⭐', style: const TextStyle(color: Colors.black)),
                  Text(feedbackLink ?? '', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ],
            ),
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (feedbackLink != null)
                  TextButton(
                    onPressed: () {},
                    child: const Text('View Your Feedback', style: TextStyle(color: Colors.red)),
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: canReorder ? Colors.red : Colors.grey,
                  ),
                  onPressed: canReorder ? () {} : null,
                  child: Text(canReorder ? 'Reorder' : 'Currently Not Deliverable'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


