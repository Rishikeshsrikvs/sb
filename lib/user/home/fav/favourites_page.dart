import 'package:flutter/material.dart';


class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        title: const Text("Favourites", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            color: Colors.lightGreen,
            child: TabBar(
              padding: const EdgeInsets.all(8),
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.teal[900], // Dark background for the selected tab
                borderRadius: BorderRadius.circular(5),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Tab(text: "RESTAURANT"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Tab(text: "FOOD ITEMS"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Restaurant Tab Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Content for the Restaurant tab
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/hotelhero.png', // Correct your image path here
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: const Text("Kim Ling Chinese Restaurant"),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.green, size: 16),
                            SizedBox(width: 4),
                            Text("4.0", style: TextStyle(color: Colors.black)),
                            Spacer(),
                            Icon(Icons.access_time, size: 16),
                            SizedBox(width: 4),
                            Text("20 Mins", style: TextStyle(color: Colors.black)),
                            Spacer(),
                            Icon(Icons.location_on, size: 16),
                            SizedBox(width: 4),
                            Text("3.2 Km", style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Text("Anna Nagar, Chennai"),
                      ],
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.shade100,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Flat Deal",
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          Text(
                            "100 off above ₹999",
                            style: TextStyle(fontSize: 4, color: Colors.black54,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Food Items Tab Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/menuimage.png', // Replace with your image path
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                     const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Item Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Kim Ling Chinese Restaurant",
                              style: TextStyle(color: Colors.black54),
                            ),
                             Row(
                              children: [
                                Icon(Icons.star, color: Colors.green, size: 16),
                                SizedBox(width: 4),
                                Text("4.0", style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              "₹ 200/-",
                              style: TextStyle(
                                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {},
                              ),
                              const Text("1"),
                              IconButton(
                                icon:const Icon(Icons.add_circle_outline),
                                onPressed: () {},
                              ),
                            ],
                          ),
                         ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[900], // Updated property name
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                              ),
                              child:const Text("Add To Cart"),
                            ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
