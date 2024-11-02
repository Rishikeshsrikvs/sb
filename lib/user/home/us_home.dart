import 'package:flutter/material.dart';
import 'package:soupboys/user/home/widgets/category_buttons_widget.dart';
import 'package:soupboys/user/home/widgets/offer_banner_widget.dart';
import 'package:soupboys/user/home/widgets/restaurant_card_widget.dart';
import 'package:soupboys/user/home/widgets/search_bar_widget.dart';
import 'package:soupboys/user/home/widgets/soup_container.dart';

class UsHome extends StatelessWidget {
  const UsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(),
              SizedBox(height: 16),
              OfferBannerWidget(),
              SizedBox(height: 16),
              CategoryButtonsWidget(),
              SizedBox(height: 16),
              RestaurantListWidget(),
              SizedBox(height: 16),
              SoupContainer(),
            ],
          ),
        ),
      );
  }
}