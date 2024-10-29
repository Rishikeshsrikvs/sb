import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo.dart';

class ShopCredentials extends StatelessWidget {
  const ShopCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
          const Logo(height: 75,width: 200,),
          const SizedBox(height: 16.0), // Add spacing between logo and text
          const Text(
            'Sign in to your Account',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold, // Optional: make it bold
            ),
          ),
          const SizedBox(height: 16.0), // Add spacing between text and row
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the row contents
            children: [
              const Text("Don’t have an account?"),
              TextButton(
                onPressed: () {
                   Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const ShopCredentials()),
                );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
