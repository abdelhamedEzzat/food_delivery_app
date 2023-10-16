import 'package:flutter/material.dart';

import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/model/price_model.dart';
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
          leading: Icon(Icons.close,
              color: Theme.of(context).colorScheme.primaryContainer),
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
              CustomPriceFilter(prices: Price.prices),
              Text(
                "Category",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              CustomCategryFilter(categories: Category.categories),
            ],
          ),
        ));
  }
}
