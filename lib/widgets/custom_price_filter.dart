import 'package:flutter/material.dart';

import '../model/price_model.dart';

class CustomPriceFilter extends StatelessWidget {
  final List<Price> prices;
  const CustomPriceFilter({
    Key? key,
    required this.prices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: prices
          .map((price) => InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    price.price,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
