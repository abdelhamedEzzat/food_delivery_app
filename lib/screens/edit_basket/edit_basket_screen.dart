import 'package:flutter/material.dart';

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
