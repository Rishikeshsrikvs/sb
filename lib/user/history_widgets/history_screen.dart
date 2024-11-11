import 'package:flutter/material.dart';
import 'package:soupboys/user/history_widgets/reorder/notaval.dart';
import 'package:soupboys/user/history_widgets/reorder/reorder.dart';
import 'package:soupboys/user/home/home_page.dart';




class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(174, 220, 26, 1),
      appBar: AppBar(
        backgroundColor: const  Color.fromRGBO(174, 220, 26, 1),
        title: const Text("History"),
         leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),        
                );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search by restaurant or dish",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Order Cards
            Expanded(
              child: ListView(
                children: [
                  orderCard(
                    hotelName: 'Hotel A',
                    hotelLocation: 'Downtown',
                    items: {'Burger': 2, 'Fries': 1},
                    orderDate: '11 Sep, 7:52 PM',
                    amount: '₹ 613.88',
                    rating: 3,
                    isReorderAvailable: true,
                  ),
                  const SizedBox(height: 16),
                  orderCard(
                    hotelName: 'Hotel B',
                    hotelLocation: 'Uptown',
                    items: {'Pizza': 1},
                    orderDate: '12 Sep, 1:30 PM',
                    amount: '₹ 450.50',
                    rating: 4,
                    isReorderAvailable: false,
                  ),
                  const SizedBox(height: 16),
                  orderCard(
                    hotelName: 'Hotel C',
                    hotelLocation: 'Midtown',
                    items: {'Sushi': 2, 'Ramen': 1},
                    orderDate: '13 Sep, 6:00 PM',
                    amount: '₹ 780.00',
                    rating: 5,
                    isReorderAvailable: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget orderCard({
    required String hotelName,
    required String hotelLocation,
    required Map<String, int> items,
    required String orderDate,
    required String amount,
    required int rating,
    required bool isReorderAvailable,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hotelInfoSection(hotelName, hotelLocation),
          const SizedBox(height: 10),
          itemListSection(items),
          const Divider(),
          orderInfoSection(orderDate, amount),
          const Divider(),
          feedbackSection(rating, isReorderAvailable),
        ],
      ),
    );
  }

  Widget hotelInfoSection(String hotelName, String hotelLocation) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 7, 24, 8),
      ),
      padding: const EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image Placeholder
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          // Hotel Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  hotelLocation,
                  style: const TextStyle(color: Colors.white70),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'View Menu >',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemListSection(Map<String, int> items) {
    return Column(
      children: items.entries
          .map(
            (entry) =>
                itemRow(count: entry.value.toString(), itemName: entry.key),
          )
          .toList(),
    );
  }

  Widget itemRow({required String count, required String itemName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$count $itemName",
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 15, 15, 15),
          ),
        ),
      ],
    );
  }

  Widget orderInfoSection(String orderDate, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order placed on $orderDate',
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        const Text(
          'Delivered',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Amount: $amount',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget feedbackSection(int rating, bool isReorderAvailable) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('You Rated '),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'View Your Feedback >',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        isReorderAvailable ? const Reorder() : const Notaval(),
      ],
    );
  }
}
