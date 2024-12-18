// shopkeeper_login_page.dart
import 'package:flutter/material.dart';
import 'package:soupboys/logo/logo_image.dart';
import 'package:soupboys/services/api_service.dart';

import 'package:soupboys/admin/ad%20dashboard/ad_dashboard.dart';
import 'package:soupboys/deliveryman/del%20dashboard/del_dashboard.dart';
import 'package:soupboys/shopkeeper/shopdashboard/Shop_dashboard.dart';
import 'package:soupboys/shopkeeper/shoplogin/shopkeeper_creation.dart';

class ShopkeeperLoginPage extends StatefulWidget {
  const ShopkeeperLoginPage({Key? key}) : super(key: key);

  @override
  _ShopkeeperLoginPage createState() => _ShopkeeperLoginPage();
}

class _ShopkeeperLoginPage extends State<ShopkeeperLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _login() async {
    try {
      final response = await ApiService.postRequest(
        '/api/split/login', // Specify endpoint here
        {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      final role = response['role'];

      if (role == 'Admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AdDashboard()),
        );
      } else if (role == 'Delivary') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DelDashboard()),
        );
      } else if (role == 'Shopkeeper') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ShopDashboard()),
        );
      } else {
        throw Exception('Invalid role');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D28),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoImage(height: 40, width: 90),
              const SizedBox(height: 20),
              const Text(
                "Sign in to your Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountCreationPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: emailController,
                      hintText: "example@gmail.com",
                      icon: Icons.email,
                    ),
                    _buildTextField(
                      controller: passwordController,
                      hintText: "********",
                      icon: Icons.lock,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: const Text(
                    "Forgot Your Password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        obscureText: isPassword && !_isPasswordVisible,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: Icon(icon, color: Colors.black),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}





 