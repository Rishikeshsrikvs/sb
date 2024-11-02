import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.menu, color: Colors.white),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AVADI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Text('Chennai', style: TextStyle(color: Colors.black54)),
            ],
          ),
          Spacer(),
          
        ],
      ),
      SizedBox(height: 10),
     Align( // Aligns the text to the left side
          alignment: Alignment.centerLeft, // Aligns the text to the left
          child: Text(
            'Hey Gandhi MS, Good Afternoon!',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ]
    );
  }
}
