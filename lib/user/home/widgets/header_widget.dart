// header_widget.dart
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                // Open the drawer when tapped
                Scaffold.of(context).openDrawer();  // Open the left drawer
              },
              child: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.menu, color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AVADI',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Chennai',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hey Gandhi MS, Good Afternoon!',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
