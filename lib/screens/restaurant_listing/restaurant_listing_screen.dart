import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = "RestaurantListingScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RestaurantListingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const RestaurantListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen")),
      body: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/location");
        },
        child: Text(" Navigator to Loctain Screen  "),
      ),
    );
  }
}
