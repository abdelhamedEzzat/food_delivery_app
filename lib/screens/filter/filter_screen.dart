import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text("HomeScreen")),
      body: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/location");
        },
        child: const Text(" Navigator to Loctain Screen  "),
      ),
    );
  }
}
