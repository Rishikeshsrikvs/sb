import 'package:flutter/material.dart';

class Reorder extends StatefulWidget {
  const Reorder({super.key});

  @override
  State<Reorder> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Reorder> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.refresh, color: Colors.white),
          label: const Text(
            'Reorder',
            style: TextStyle(fontSize: 10),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
  }
}