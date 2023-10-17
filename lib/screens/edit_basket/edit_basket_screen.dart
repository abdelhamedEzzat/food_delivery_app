import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/basket/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  static const String routeName = "EditBasketScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const EditBasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const EditBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Basket"),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50.h),
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text("Done"),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Items",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is BasketLoaded) {
                      return state.basket.items.length == 0
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("No Items in the Basket",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!),
                                ],
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.basket
                                  .itemQuantity(state.basket.items)
                                  .keys
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    top: 5.h,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                        ),
                                      ),
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>().add(
                                                RemoveAllItems(state.basket
                                                    .itemQuantity(
                                                        state.basket.items)
                                                    .keys
                                                    .elementAt(index)));
                                          },
                                          icon: const Icon(Icons.delete)),
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>().add(
                                                RemoveItem(state.basket
                                                    .itemQuantity(
                                                        state.basket.items)
                                                    .keys
                                                    .elementAt(index)));
                                          },
                                          icon:
                                              const Icon(Icons.remove_circle)),
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>().add(
                                                AddItem(state.basket
                                                    .itemQuantity(
                                                        state.basket.items)
                                                    .keys
                                                    .elementAt(index)));
                                          },
                                          icon: const Icon(Icons.add_circle))

                                      // Text(
                                      //   "\$${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x",
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .headlineSmall!
                                      //       .copyWith(
                                      //           color: Theme.of(context)
                                      //               .colorScheme
                                      //               .primary),
                                      // ),
                                    ],
                                  ),
                                );
                              },
                            );
                    } else {
                      return Text("SomeThing went Wrong");
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
