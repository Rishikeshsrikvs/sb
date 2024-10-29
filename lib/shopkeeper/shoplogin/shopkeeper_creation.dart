import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo.dart';
import 'package:soupboys/logo/logo_image.dart';

class AccountCreationPage extends StatefulWidget {
  @override
  _AccountCreationPageState createState() => _AccountCreationPageState();
}

class _AccountCreationPageState extends State<AccountCreationPage> {
  // Controllers for input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D28), // Dark background
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo widget
             const LogoImage(height: 40, width: 90),
              const SizedBox(height: 20),
              const Text(
                "Create account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white54),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate back to Login Page
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Role selection (Shop Owner, Admin, Delivery Man)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _roleSelectionButton("Shop Owner", true),
                  _roleSelectionButton("Admin", false),
                  _roleSelectionButton("Delivery Man", false),
                ],
              ),
              const SizedBox(height: 20),
              // Input fields
              Container(
                padding: const EdgeInsets.all(10), // Padding inside the container
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildTextField(nameController, "Name", Icons.person),
                    const SizedBox(height: 4),
                    _buildTextField(emailController, "Email", Icons.email),
                    const SizedBox(height: 4),
                    _buildTextField(shopNameController, "Shopname", Icons.store),
                    const SizedBox(height: 4),
                    _buildTextField(phoneController, "Phone", Icons.phone),
                    const SizedBox(height: 4),
                    _buildTextField(passwordController, "Password", Icons.lock,
                        obscureText: true),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Register button
              ElevatedButton(
                onPressed: () {
                  // Register account action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 140,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create role selection buttons
  Widget _roleSelectionButton(String role, bool isSelected) {
    return SizedBox(
  width: 90, // Set the desired width
  child: ElevatedButton(
    onPressed: () {
      // Role selection logic
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? Colors.blueAccent : Colors.white10,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    child: Text(
      role,
      style: TextStyle(
        fontSize: 10,
        color: isSelected ? Colors.white : Colors.white54,
      ),
    ),
  ),
);

  }

  // Helper method to create input fields
  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon,
      {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Input field background
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
