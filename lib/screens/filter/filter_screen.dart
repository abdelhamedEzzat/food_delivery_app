import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/bloc/fillter/filter_bloc.dart';
import 'package:food_delivery_app/model/restaurant_model.dart';

import 'package:food_delivery_app/widgets/custom_category_filter.dart';
import 'package:food_delivery_app/widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = "FilterScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Filter",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer),
          ),
          // leading: Icon(Icons.close,
          //     color: Theme.of(context).colorScheme.primaryContainer),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<FilterBloc, FilterState>(
                  builder: (context, state) {
                    if (state is FilterLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FilterLoaded) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50.h),
                            shape: const RoundedRectangleBorder(),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary),
                        child: const Text("Apply"),
                        onPressed: () {
                          var categories = state.filter.categoryFilter
                              .where((filter) => filter.value)
                              .map((filter) => filter.category.name)
                              .toList();
                          print(categories);

                          var price = state.filter.priceFilter
                              .where((filter) => filter.value)
                              .map((filter) => filter.price.price)
                              .toList();
                          print(price);

                          List<Restaurant> restaurant = Restaurant.restaurants
                              .where((restaurants) => categories.any(
                                  (category) =>
                                      restaurants.tags.contains(category)))
                              .where((restaurants) => price.any((price) =>
                                  restaurants.priceCategory.contains(price)))
                              .toList();
                          Navigator.of(context).pushNamed(
                              "RestaurantListingScreen",
                              arguments: restaurant);
                        },
                      );
                    } else {
                      return const Text("Something Went Wrong !");
                    }
                  },
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const CustomPriceFilter(),
              Text(
                "Category",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const CustomCategryFilter(),
            ],
          ),
        ));
  }
}
