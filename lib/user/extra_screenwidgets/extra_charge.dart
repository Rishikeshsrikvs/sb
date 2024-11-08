// ignore: file_names
import 'package:flutter/material.dart';

class ExtraChargesScreen extends StatelessWidget {
  const ExtraChargesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 194, 194), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.end, // Move content to the bottom
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjusts size to fit content
                  children: [
                    const SizedBox(height: 5,width: 10,),
                    const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assest/Pasted image.png', // Corrected image path
                      height: 150,
                      fit: BoxFit.cover, // Ensure the image fits well
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Your Food Will Be Delivered From A Distant Location.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 18,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Additional Distance Charges Can Be Applied.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                size: 18,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Delivery Can Take Longer Than Expected, Which Could Impact The Temperature Of Your Food.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement action on button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 143, 236, 37),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            'Okay, got it!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
