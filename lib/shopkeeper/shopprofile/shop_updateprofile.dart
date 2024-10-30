// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Myex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade600,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          elevation: 0,
          title: const Text('Payment history', style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF291E43),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF181C2E),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Order ID",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "#5343435",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Customer Name",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "M S Gandhi",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Phone Number",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "2356891470",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 140,
                          height: 130,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                           
                          ),
                          child: const Column(
                             
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Item List",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "x2",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Item List",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "x2",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text("grand",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                     Text("amount",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                    SizedBox(height: 10,),
                                    Text("560",style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.red,
                                      
                                    ),
                                    ),
                                    SizedBox(height: 3,
                                    ),
                                    Text("Gpay" ,style: TextStyle(
                                      color: Colors.white,
                                    ),)
                                  ],
                                
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text("Payment details",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                     
                                    SizedBox(height: 10,),
                                    Container(
                                      color: Colors.green,
                                      padding: EdgeInsets.all(10),
                                      child: Text("successfull",style: TextStyle(
                                        color: Colors.white
                                      ),
                                      ),
                                    ),
                                    SizedBox(height: 3,
                                    ),
                                    Text("Gpay" ,style: TextStyle(
                                      color: Colors.white,
                                    ),)
                                  ],
                                
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
