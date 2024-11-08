import 'package:flutter/material.dart';
import 'package:soupboys/user/home/us_drawer.dart';
import 'package:soupboys/user/home/widgets/header_widget.dart';
import 'package:soupboys/user/home/widgets/category_buttons_widget.dart';
import 'package:soupboys/user/home/widgets/offer_banner_widget.dart';
import 'package:soupboys/user/home/widgets/restaurant_card_widget.dart';
import 'package:soupboys/user/home/widgets/search_bar_widget.dart';
import 'package:soupboys/user/home/widgets/soup_container.dart';



class UsHome extends StatelessWidget {
  const UsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100, // Set a custom height for the AppBar
        title: HeaderWidget(),
        automaticallyImplyLeading: false,
      ),
      // Use the DrawerWidget here instead of inline Drawer
      drawer: UsDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(),
              const SizedBox(height: 16),
              OfferBannerWidget(),
              const SizedBox(height: 16),
              CategoryButtonsWidget(),
              const SizedBox(height: 16),
              const RestaurantListWidget(),
              const SizedBox(height: 16),
              SoupContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
