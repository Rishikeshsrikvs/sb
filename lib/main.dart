import 'package:flutter/material.dart';
import 'package:soupboys/splashscreen/splashscreen.dart';

void main() {
  runApp(const SoupBoys());
}

class SoupBoys extends StatelessWidget {
  const SoupBoys({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
