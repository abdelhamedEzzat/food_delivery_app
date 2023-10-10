import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          const GMaps(lat: 10, lang: 10),
          Positioned(
              left: 20,
              right: 20,
              top: 40,
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/Images/logo.svg",
                      height: 50,
                    ),
                    const Expanded(child: LocationSearchBox()),
                  ],
                ),
              )),
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
          Positioned(
            right: 20,
            bottom: 55,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
