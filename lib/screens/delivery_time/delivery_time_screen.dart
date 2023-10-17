import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/basket/basket_bloc.dart';
import '../../model/delivery_time_model.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = "DeliveryTimeScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const DeliveryTimeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const DeliveryTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Delivery Time")),
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
                  child: const Text("Select"),
                )
              ],
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Choose a Date",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("The Delivery is Today"),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        child: const Text("Today")),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("The Delivery is Tomorrow"),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        child: const Text("Tomorrow")),
                  ],
                ),
              ),
              Text(
                "Choose The Time",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: GridView.builder(
                      itemCount: DeliveryTime.deliveryTimes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 2.5),
                      itemBuilder: ((context, index) {
                        return BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            return Card(
                              child: TextButton(
                                  onPressed: () {
                                    context.read<BasketBloc>().add(
                                        SelectDliveryTime(
                                            DeliveryTime.deliveryTimes[index]));
                                  },
                                  child: Text(
                                    " ${DeliveryTime.deliveryTimes[index].value}",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )),
                            );
                          },
                        );
                      })),
                ),
              )
            ])));
  }
}
