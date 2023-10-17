import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/bloc/basket/basket_bloc.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = "BasketScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Basket"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("EditBasketScreen");
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("BasketScreen");
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50.h),
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text("Go To Checkout"),
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
                  "Cutlery",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Do You Need Cutlery",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is BasketLoaded) {
                            return SizedBox(
                                width: 100.w,
                                child: SwitchListTile(
                                  value: state.basket.cutlery,
                                  dense: false,
                                  onChanged: (bool? newvalue) {
                                    context
                                        .read<BasketBloc>()
                                        .add(ToggleSwitch());
                                  },
                                ));
                          } else {
                            return Text("Something Went Wrong");
                          }
                        },
                      )
                    ],
                  ),
                ),
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
                                      Text(
                                        "\$${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
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
                Container(
                  height: 100.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: 5.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/Images/delivery_time.svg"),
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is BasketLoaded) {
                            return (state.basket.deliveryTime == null)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text("Delivery in 20 Minutes",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "DeliveryTimeScreen");
                                        },
                                        child: Text("Change",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer)),
                                      )
                                    ],
                                  )
                                : Text(
                                    " Delivery at ${state.basket.deliveryTime!.value}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!);
                          } else {
                            return Text("SomeThing Went Wrong");
                          }
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: 5.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is BasketLoaded) {
                            return (state.basket.voucher == null)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text("Do you Have a voucher ?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed("VoucherScreen");
                                        },
                                        child: Text("apply",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer)),
                                      )
                                    ],
                                  )
                                : Text("Your Voucher is added!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!);
                          } else {
                            return Text("SomeThing Went Wrong");
                          }
                        },
                      ),
                      SvgPicture.asset('assets/Images/delivery_time.svg'),
                    ],
                  ),
                ),
                Container(
                    height: 100.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 5.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is BasketLoaded) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SubTotal ",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    " \$${state.basket.subtotalString}",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Fee ",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    "\$5.00 ",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer),
                                  ),
                                  Text(" \$${state.basket.totalString}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                          ))
                                ],
                              )
                            ],
                          );
                        } else {
                          return const Text("SomeThing went Wrong");
                        }
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
