// ignore_for_file: unreachable_switch_case

import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/models.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';

import '../screens/basket/basket_screen.dart';
import '../screens/delivery_time/delivery_time_screen.dart';
import '../screens/edit_basket/edit_basket_screen.dart';
import '../screens/filter/filter_screen.dart';
import '../screens/restaurant_details/restaurant_details_screen.dart';
import '../screens/restaurant_listing/restaurant_listing_screen.dart';
import '../screens/voucher/voucher_screen.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments! as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("error"),
              ),
            ),
        settings: const RouteSettings(name: "/error"));
  }
}
