import 'package:flutter/material.dart';

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
