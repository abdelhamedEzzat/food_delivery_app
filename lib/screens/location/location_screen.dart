import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text("Location Screen ")),
    );
  }
}
