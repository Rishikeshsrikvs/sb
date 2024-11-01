import 'package:flutter/material.dart';

class ApprovalData {
  final String hotelName;
  final String location;
  final String ownerName;
  final String email;
  final String number;
  final String type; // Delivery Man or ShopKeeper
  final DateTime date;

  ApprovalData({
    required this.hotelName,
    required this.location,
    required this.ownerName,
    required this.email,
    required this.number,
    required this.type,
    required this.date,
  });
}

// Dummy API Data
List<ApprovalData> dummyData = [
  ApprovalData(
    hotelName: 'Hotel A',
    location: 'Location 1',
    ownerName: 'Owner 1',
    email: 'owner1@example.com',
    number: '1234567890',
    type: 'ShopKeeper',
    date: DateTime.now(),
  ),
  ApprovalData(
    hotelName: 'Hotel B',
    location: 'Location 2',
    ownerName: 'Owner 2',
    email: 'owner2@example.com',
    number: '0987654321',
    type: 'Delivery Man',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  // Add more entries if needed
];

class ApprovalScreen extends StatefulWidget {
  @override
  _ApprovalScreenState createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  String selectedType = 'ShopKeeper';
  bool showToday = true;

  List<ApprovalData> get filteredData {
    DateTime today = DateTime.now();
    return dummyData.where((item) {
      final matchesType = item.type == selectedType;
      final matchesDate = showToday
          ? item.date.day == today.day &&
              item.date.month == today.month &&
              item.date.year == today.year
          : true;
      return matchesType && matchesDate;
    }).toList();
  }

  void toggleType() {
    setState(() {
      selectedType = selectedType == 'ShopKeeper' ? 'Delivery Man' : 'ShopKeeper';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Approval',
        style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterButton(
                text: selectedType, // Displays current selected type
                isSelected: true,
                onPressed: toggleType, // Toggle between types on press
              ),
              FilterButton(
                text: 'Today',
                isSelected: showToday,
                onPressed: () {
                  setState(() {
                    showToday = !showToday;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final data = filteredData[index];
                return ApprovalCard(data: data);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  FilterButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon:const Icon(
        Icons.filter_list,
        color: Colors.white,
        size: 18,
      ),
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: isSelected ? Colors.green : Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle:const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ApprovalCard extends StatelessWidget {
  final ApprovalData data;

  ApprovalCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF303030), // Dark grey background for the card
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hotel Name:',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Location:',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.hotelName,
                  style: const TextStyle(color: Colors.white70),
                ),
                Text(
                  data.location,
                  style:const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            const Divider(color: Colors.white24),
            Text(
              'Owner Name: ${data.ownerName}',
              style:const TextStyle(color: Colors.white70),
            ),
            Text(
              'Email ID: ${data.email}',
              style:const TextStyle(color: Colors.white70),
            ),
            Text(
              'Number: ${data.number}',
              style:const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'STATUS',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child:const Text('Approve', style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child:const  Text('Deny', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
