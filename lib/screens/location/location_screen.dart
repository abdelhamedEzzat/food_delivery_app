import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/bloc/auto_complete_bloc/auto_complete_bloc.dart';
import 'package:food_delivery_app/bloc/geolocation_bloc/goelocation_bloc.dart';
import 'package:food_delivery_app/widgets/gmaps.dart';
import 'package:food_delivery_app/widgets/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = "locationScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<GoelocationBloc, GoelocationState>(
            builder: (context, state) {
              if (state is GoelocationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GoelocationLoaded) {
                return GMaps(
                    lat: state.position.latitude,
                    lang: state.position.longitude);
              } else {
                return const Center(child: Text("Something Went Wrong. "));
              }
            },
          ),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/Images/logo.svg",
                      height: 50,
                    ),
                    Expanded(child: LocationSearchBox()),
                  ],
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.only(top: 20),
                  child: BlocBuilder<AutoCompleteBloc, AutoCompleteState>(
                    builder: (context, state) {
                      if (state is AutoCompleteLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is AutoCompleteLoaded) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          color: state.autoComplete.length > 0
                              ? Colors.black.withOpacity(0.5)
                              : Colors.transparent,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.autoComplete.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(
                                  state.autoComplete[index].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text(
                            "Something in Search place Went Wrong.");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //     left: 20,
          //     right: 20,
          //     top: 40,
          //     child: SizedBox(
          //       height: 100,
          //       child:
          //     )),
          Positioned(
            left: 20,
            right: 20,
            bottom: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ),
          // Positioned(
          //   right: 20,
          //   bottom: 55,
          //   child: InkWell(
          //     onTap: () {},
          //     child: CircleAvatar(
          //       backgroundColor: Theme.of(context).colorScheme.background,
          //       child: const Icon(
          //         Icons.my_location,
          //         color: Colors.black,
          //         size: 25,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
