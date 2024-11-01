import 'package:flutter/material.dart';




class AdShopmanage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB5E28), // Background color of the page
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Shopkeeper Management", style: TextStyle(color: Colors.white)),
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
          itemCount: 3, // Number of shopkeeper cards
          itemBuilder: (context, index) {
            return ShopkeeperCard();
          },
        ),
      ),
    );
  }
}

class ShopkeeperCard extends StatelessWidget {
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
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "TODAY",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hotel Name",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Location",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[600]),
          SizedBox(height: 8.0),
          Text(
            "Owner Name :",
            style: TextStyle(color: Colors.grey[400]),
          ),
          Text(
            "Email ID :",
            style: TextStyle(color: Colors.grey[400]),
          ),
          Text(
            "Number :",
            style: TextStyle(color: Colors.grey[400]),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusButton(label: "Orders", value: "12", color: Colors.green),
              StatusButton(label: "Earnings", value: "400", color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const StatusButton({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
