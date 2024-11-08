import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';


class AccountCreationPage extends StatefulWidget {
  @override
  _AccountCreationPageState createState() => _AccountCreationPageState();
}

class _AccountCreationPageState extends State<AccountCreationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController adminPhoneController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();

  String selectedRole = "Shop Owner";

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    shopNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    adminPhoneController.dispose();
    vehicleNumberController.dispose();
    super.dispose();
  }

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D28),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Sign Up", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const LogoImage(height: 80, width: 100),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _roleSelectionButton("Shop Owner"),
               
                _roleSelectionButton("Delivery Man"),
              ],
            ),
            const SizedBox(height: 20),
            // Container for input fields
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: _buildFormFields(),
            ),
            const SizedBox(height: 20),
            // Register button
            ElevatedButton(
              onPressed: () {
                // Handle register action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 110,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create role selection buttons
  Widget _roleSelectionButton(String role) {
    final bool isSelected = selectedRole == role;

    return SizedBox(
      width: 90,
      child: ElevatedButton(
        onPressed: () {
          selectRole(role);
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

  // Builds different forms based on the selected role
  Widget _buildFormFields() {
    switch (selectedRole) {
      case "Shop Owner":
        return Column(
          children: [
            _buildTextField(nameController, "Name", Icons.person),
            _buildTextField(emailController, "Email", Icons.email),
            _buildTextField(shopNameController, "Shop Name", Icons.store),
            _buildTextField(phoneController, "Phone", Icons.phone),
            _buildTextField(passwordController, "Password", Icons.lock, obscureText: true),
          ],
        );
      case "Admin":
        return Column(
          children: [
            _buildTextField(nameController, "Name", Icons.person),
            _buildTextField(emailController, "Email", Icons.email),
            _buildTextField(adminPhoneController, "Admin Phone", Icons.phone),
            _buildTextField(passwordController, "Password", Icons.lock, obscureText: true),
          ],
        );
      case "Delivery Man":
        return Column(
          children: [
            _buildTextField(nameController, "Name", Icons.person),
            _buildTextField(emailController, "Email", Icons.email),
            _buildTextField(phoneController, "Phone", Icons.phone),
            _buildTextField(vehicleNumberController, "Vehicle Number", Icons.directions_car),
            _buildTextField(passwordController, "Password", Icons.lock, obscureText: true),
          ],
        );
      default:
        return Container();
    }
  }

  // Helper method to create text fields with icons
  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon, {
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: Icon(icon, color: Colors.blue),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
