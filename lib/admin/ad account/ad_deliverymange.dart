import 'package:flutter/material.dart';


class AdDeliverymange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB5E28), // Background color of the page
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Delivery Man Management", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
              Navigator.pop(context);
          }, // Define back button behavior
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 4, // Number of delivery man cards
          itemBuilder: (context, index) {
            return DeliveryManCard();
          },
        ),
      ),
    );
  }
}

class DeliveryManCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF2D2A4A), // Dark background color for cards
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Man Name",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Total Orders",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              Text(
                "Earnings",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[600]),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Ratings ",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  Text(
                    "4.0",
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "VIEW ORDERS",
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              TodayButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class TodayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "TODAY",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
