import 'package:flutter/material.dart';
import 'package:soupboys/user/home/hotel_menu.dart';
import 'explore_sort.dart';
class RestaurantListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add the Container with "Restaurants to Explore" and buttons
        ExploreSection(),
        SizedBox(height: 20),
        // Restaurant List
        RestaurantCardWidget(
          imageUrl: 'assets/images/menuimage.png',
          restaurantName: 'Kim Ling Chinese Restaurant',
          rating: 4.0,
          time: '35 Mins',
          distance: '5 Km',
          location: 'Anna Nagar, Chennai',
          offerText: '₹100 Off Above ₹199',
        ),
        RestaurantCardWidget(
          imageUrl: 'assets/images/menuimage.png',
          restaurantName: 'The Cascade',
          rating: 4.0,
          time: '20 Mins',
          distance: '3.2 Km',
          location: 'Nungambakkam, Chennai',
          offerText: '₹100 Off Above ₹199',
        ),
        RestaurantCardWidget(
          imageUrl: 'assets/images/menuimage.png',
          restaurantName: 'Liza Restaurant',
          rating: 3.9,
          time: '30 Mins',
          distance: '4.7 Km',
          location: 'Vepery, Chennai',
          offerText: '₹100 Off Above ₹199',
        ),
        RestaurantCardWidget(
          imageUrl: 'assets/images/menuimage.png',
          restaurantName: 'Liza Restaurant',
          rating: 3.9,
          time: '30 Mins',
          distance: '4.7 Km',
          location: 'Vepery, Chennai',
          offerText: '₹100 Off Above ₹199',
        ),
      ],
    );
  }
}

// Widget for Explore Section (Title and Buttons)

// Widget for Restaurant Cards
class RestaurantCardWidget extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final double rating;
  final String time;
  final String distance;
  final String location;
  final String offerText;

  RestaurantCardWidget({
    required this.imageUrl,
    required this.restaurantName,
    required this.rating,
    required this.time,
    required this.distance,
    required this.location,
    required this.offerText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle card tap, maybe navigate to details page
        // Navigator.push(...);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantMenuScreen(),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  image: DecorationImage(
                    image: AssetImage(imageUrl), // Load image from assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.green, size: 16),
                      SizedBox(width: 2),
                      Text('$rating'),
                      SizedBox(width: 10),
                      Text(time),
                      SizedBox(width: 10),
                      Text(distance),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    location,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    offerText,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
