import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryTrackingPage extends StatefulWidget {
  @override
  _DeliveryTrackingPageState createState() => _DeliveryTrackingPageState();
}

class _DeliveryTrackingPageState extends State<DeliveryTrackingPage> {
  GoogleMapController? mapController;

  final LatLng _initialPosition =
      LatLng(37.7749, -122.4194); // Example location
  final Set<Polyline> _polylines = {
    Polyline(
      polylineId: PolylineId("route"),
      points: [
        LatLng(37.7749, -122.4194),
        LatLng(37.7849, -122.4294),
      ],
      color: Colors.red,
      width: 5,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 13,
            ),
            polylines: _polylines,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
          // Back button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
          ),
          // ETA and marker
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Icon(Icons.timer, color: Colors.green),
                  SizedBox(width: 5),
                  Text("25 min"),
                ],
              ),
            ),
          ),
          // Delivery Info
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 120, 236, 12),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assest/man1.png"),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "M S Gandhi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                          Text(
                            "Delivery man",
                            style: TextStyle(
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      _buildIconWithBorder(
                          Icons.call, const Color.fromARGB(255, 0, 0, 0)),
                      SizedBox(width: 20),
                      _buildIconWithBorder(
                          Icons.navigation, const Color.fromARGB(255, 2, 0, 0)),
                    ],
                  ),
                  Divider(color: const Color.fromARGB(137, 136, 133, 133)),
                  Row(
                    children: [
                      _buildIconWithBorder(Icons.location_on,
                          const Color.fromARGB(255, 0, 0, 0)),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Maitama, Agonsi, 21 trival estate",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _buildIconWithBorder(
                          Icons.directions, const Color.fromARGB(255, 0, 0, 0)),
                      SizedBox(width: 5),
                      Text("ETA 30 mins",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithBorder(IconData iconData, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(6), // Space between icon and border
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Icon(iconData, color: iconColor),
    );
  }
}
