import 'package:flutter/material.dart';

class StatCard2 extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color backgroundColor;
  final Color? textColor;
  final Color? iconColor;

  const StatCard2({
    required this.title,
    required this.count,
    required this.icon,
    required this.backgroundColor,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Full-width card
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Icon(
                  icon,
                  color: iconColor ?? Colors.red,
                  size: 20,
                ),
              ),
              SizedBox(width: 10),
              Text(
                count,
                style: TextStyle(
                  color: textColor ?? Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
