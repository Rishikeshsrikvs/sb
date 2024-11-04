import 'package:flutter/material.dart';

class Notaval extends StatefulWidget {
  const Notaval({super.key});

  @override
  State<Notaval> createState() => _NotavalState();
}

class _NotavalState extends State<Notaval> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.refresh, color: Colors.white),
      label: const Text(
        'Currently Not Availble',
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
