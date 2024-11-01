import 'package:flutter/material.dart';



class PaymentHistoryScreen extends StatelessWidget {
   const PaymentHistoryScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          PaymentCard(
            orderId: '#5343435',
            customerName: 'M S Gandhi',
            phoneNumber: '2356891470',
            location: 'Address',
            itemList: 'X2',
            grandAmount: '₹560',
            paymentStatus: 'Successful',
          ),
          PaymentCard(
            orderId: '#5343435',
            customerName: 'M S Gandhi',
            phoneNumber: '2356891470',
            location: 'Address',
            itemList: 'X2',
            grandAmount: '₹560',
            paymentStatus: 'Successful',
          ),
          PaymentCard(
            orderId: '#5343435',
            customerName: 'M S Gandhi',
            phoneNumber: '2356891470',
            location: 'Address',
            itemList: 'X2',
            grandAmount: '₹560',
            paymentStatus: 'Denied',
          ),
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String phoneNumber;
  final String location;
  final String itemList;
  final String grandAmount;
  final String paymentStatus;

  PaymentCard({
    required this.orderId,
    required this.customerName,
    required this.phoneNumber,
    required this.location,
    required this.itemList,
    required this.grandAmount,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: $orderId', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Customer Name: $customerName'),
            Text('Phone Number: $phoneNumber'),
            Text('Location: $location'),
            Text('Item List: $itemList'),
            Text('Grand Amount: $grandAmount'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment Status: $paymentStatus', style: TextStyle(color: paymentStatus == 'Successful' ? Colors.green : Colors.red)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
