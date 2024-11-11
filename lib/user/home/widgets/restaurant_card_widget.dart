import 'package:flutter/material.dart';
import 'package:soupboys/user/extra_screenwidgets/rate_hotel.dart';
import 'package:soupboys/user/home/hotel_menu.dart';
import 'explore_sort.dart';

class RestaurantListWidget extends StatefulWidget {
  const RestaurantListWidget({super.key});

  @override
  _RestaurantListWidgetState createState() => _RestaurantListWidgetState();
}

class _RestaurantListWidgetState extends State<RestaurantListWidget> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> restaurantList = [
    {"name": "Kim Ling Chinese Restaurant", "location": "Anna Nagar, Chennai", "image": 'assets/images/menuimage.png', "offer": '₹100 Off Above ₹199', "rating": "4.0", "time": "35 Mins", "distance": "5 Km"},
    {"name": "The Cascade", "location": "Nungambakkam, Chennai", "image": 'assets/images/menuimage.png', "offer": '₹100 Off Above ₹199', "rating": "4.5", "time": "20 Mins", "distance": "3.2 Km"},
    {"name": "Liza Restaurant", "location": "Vepery, Chennai", "image": 'assets/images/menuimage.png', "offer": '₹50 Off Above ₹149', "rating": "3.9", "time": "30 Mins", "distance": "4.7 Km"},
    {"name": "Spice Hub", "location": "Kodambakkam, Chennai", "image": 'assets/images/menuimage.png', "offer": '₹80 Off Above ₹199', "rating": "4.3", "time": "25 Mins", "distance": "4 Km"},
  ];

  List<Map<String, String>> filteredRestaurantList = [];
  String selectedFilter = "Top Rating"; // Track selected button for background color

  @override
  void initState() {
    super.initState();
    filteredRestaurantList = restaurantList;
    searchController.addListener(_filterRestaurants);
  }

  void _filterRestaurants() {
    setState(() {
      filteredRestaurantList = restaurantList
          .where((restaurant) => restaurant['name']!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  // Sorting by rating (descending)
  void _sortByTopRating() {
    setState(() {
      selectedFilter = "Top Rating";
      filteredRestaurantList.sort((a, b) =>
          double.parse(b['rating']!).compareTo(double.parse(a['rating']!)));
    });
  }

  // Filter for top offers (restaurants with a specific offer text)
  void _filterTopOffers() {
    setState(() {
      selectedFilter = "Top Offers";
      filteredRestaurantList = restaurantList
          .where((restaurant) => restaurant['offer']!.isNotEmpty)
          .toList();
    });
  }

  // Filter for fast delivery (e.g., delivery time less than 30 mins)
  void _filterFastDelivery() {
    setState(() {
      selectedFilter = "Fast Delivery";
      filteredRestaurantList = restaurantList
          .where((restaurant) =>
              int.parse(restaurant['time']!.split(' ')[0]) < 30)
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterRestaurants);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar Widget
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBarWidget(controller: searchController),
        ),
        // Add the Container with "Restaurants to Explore" and buttons
        ExploreSection(
          selectedFilter: selectedFilter,
          onTopRatingPressed: _sortByTopRating,
          onTopOffersPressed: _filterTopOffers,
          onFastDeliveryPressed: _filterFastDelivery,
        ),
        const SizedBox(height: 20),
        // Restaurant List
        ...filteredRestaurantList.map((restaurant) {
          return RestaurantCardWidget(
            imageUrl: restaurant['image']!,
            restaurantName: restaurant['name']!,
            rating: double.parse(restaurant['rating']!),
            time: restaurant['time']!,
            distance: restaurant['distance']!,
            location: restaurant['location']!,
            offerText: restaurant['offer']!,
          );
        }).toList(),
      ],
    );
  }
}

// ExploreSection Widget with buttons for sorting/filtering
class ExploreSection extends StatelessWidget {
  final String selectedFilter;
  final VoidCallback onTopRatingPressed;
  final VoidCallback onTopOffersPressed;
  final VoidCallback onFastDeliveryPressed;

  const ExploreSection({
    Key? key,
    required this.selectedFilter,
    required this.onTopRatingPressed,
    required this.onTopOffersPressed,
    required this.onFastDeliveryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: onTopRatingPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selectedFilter == "Top Rating" ? Colors.blue : Colors.grey,
          ),
          child: const Text("Top Rating"),
        ),
        ElevatedButton(
          onPressed: onTopOffersPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selectedFilter == "Top Offers" ? Colors.blue : Colors.grey,
          ),
          child: const Text("Top Offers"),
        ),
        ElevatedButton(
          onPressed: onFastDeliveryPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selectedFilter == "Fast Delivery" ? Colors.blue : Colors.grey,
          ),
          child: const Text("Fast Delivery"),
        ),
      ],
    );
  }
}

// Search Bar Widget
class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  const SearchBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search for a restaurant',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class RestaurantCardWidget extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final double rating;
  final String time;
  final String distance;
  final String location;
  final String offerText;

  const RestaurantCardWidget({
    Key? key,
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
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.more_vert),
                          onSelected: (value) {
                            if (value == "Review") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RateHotelScreen(),
                                ),
                              );
                            }
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
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      offerText,
                      style: TextStyle(color: Colors.red[600]),
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
