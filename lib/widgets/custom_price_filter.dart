import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/fillter/filter_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilterLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //todo learn what hapend here
            children: state.filter.priceFilter
                .asMap()
                .entries
                .map((price) => InkWell(
                      onTap: () {
                        //todo learn what hapend here
                        context.read<FilterBloc>().add(PriceFillterUpdated(
                            priceFilter: state.filter.priceFilter[price.key]
                                .copyWith(
                                    value: !state
                                        .filter.priceFilter[price.key].value)));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: state.filter.priceFilter[price.key].value
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(100)
                                : Colors.white),
                        child: Text(
                          //todo learn what hapend here

                          state.filter.priceFilter[price.key].price.price,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ))
                .toList(),
          );
        } else {
          return const Text("Somthing Went Wrong !");
        }
      },
    );
  }
}
