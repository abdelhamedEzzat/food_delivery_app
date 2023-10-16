import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/restaurant_model.dart';

import '../../widgets/restaurant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = "RestaurantListingScreen";
  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(restaurants: restaurants),
      settings: const RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurants;

  const RestaurantListingScreen({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurants")),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          return RestaurantCard(restaurant: restaurants[index]);
        },
      ),
    );
  }
}
