import 'package:flutter/material.dart';
import 'package:soupboys/user/extra_screenwidgets/rate_hotel.dart';
import 'package:soupboys/user/home/hotel_menu.dart';
import 'explore_sort.dart';
class RestaurantListWidget extends StatelessWidget {
   const RestaurantListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add the Container with "Restaurants to Explore" and buttons
        ExploreSection(),
        const SizedBox(height: 20),
        // Restaurant List
        const RestaurantCardWidget(
          imageUrl: 'assets/images/menuimage.png',
          restaurantName: 'Kim Ling Chinese Restaurant',
          rating: 4.0,
          time: '35 Mins',
          distance: '5 Km',
          location: 'Anna Nagar, Chennai',
          offerText: '₹100 Off Above ₹199',
        ),
        const RestaurantCardWidget(
          imageUrl: 'assets/images/menuimage.png',
          restaurantName: 'The Cascade',
          rating: 4.0,
          time: '20 Mins',
          distance: '3.2 Km',
          location: 'Nungambakkam, Chennai',
          offerText: '₹100 Off Above ₹199',
        ),
        const RestaurantCardWidget(
          imageUrl: 'assets/images/menuimage.png',
          restaurantName: 'Liza Restaurant',
          rating: 3.9,
          time: '30 Mins',
          distance: '4.7 Km',
          location: 'Vepery, Chennai',
          offerText: '₹100 Off Above ₹199',
        ),
        const RestaurantCardWidget(
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

 const RestaurantCardWidget({
    Key? key, // Add the key parameter here
    required this.imageUrl,
    required this.restaurantName,
    required this.rating,
    required this.time,
    required this.distance,
    required this.location,
    required this.offerText,
  }) : super(key: key);

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
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurantName,
                        style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // Three-dot menu
                      PopupMenuButton<String>(
                        icon:const Icon(Icons.more_vert),
                        onSelected: (value) {
                           if (value == "Review") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RateHotelScreen(),
                                ),
                              );
                            }
                          // Handle menu selection
                          // print(value);
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                           const PopupMenuItem(
                              value: "Add to Favourites",
                              child: Text("Add to Favourites"),
                            ),
                            const PopupMenuItem(
                              value: "Hide This Restaurant",
                              child: Text("Hide This Restaurant"),
                            ),
                            const PopupMenuItem(
                              value: "Similar Restaurants",
                              child: Text("Similar Restaurants"),
                            ),
                            const PopupMenuItem(
                              value: "Review",
                              child: Text("Review"),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.green, size: 16),
                      const SizedBox(width: 2),
                      Text('$rating'),
                      const SizedBox(width: 10),
                      Text(time),
                      const SizedBox(width: 10),
                      Text(distance),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    location,
                    style:const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    offerText,
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
