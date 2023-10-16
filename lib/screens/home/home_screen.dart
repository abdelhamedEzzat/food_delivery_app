// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/model/promo_model.dart';
import 'package:food_delivery_app/model/restaurant_model.dart';
import 'package:food_delivery_app/widgets/category_box.dart';
import 'package:food_delivery_app/widgets/food_search_box.dart';
import 'package:food_delivery_app/widgets/restaurant_card.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

import '../../widgets/promo_box.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Category.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryBox(category: Category.categories[index]);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 125.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Promo.promos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PromoBox(
                        promo: Promo.promos[index],
                      );
                    },
                  ),
                ),
              ),
              const FoodSearchBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Top Rated",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  return RestaurantCard(
                      restaurant: Restaurant.restaurants[index]);
                },
              ),
            ],
          ),
        ));
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.person),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current Location ",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          Text("Singapore , 1 shenton Way",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
