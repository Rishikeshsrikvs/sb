import 'dart:async';
import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo.dart';
import 'package:soupboys/splashscreen/get_started.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Getstarted(),)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(height: 200, width: 200,),
            const SizedBox(height: 20),
            const Text("Powered By", style: TextStyle(fontSize: 14)),
            Image.asset('assets/images/kvs.png', width: 50, height: 50),
          ],
        ),
      ),
    );
  }
}
