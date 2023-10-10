import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen")),
      body: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/locationScreen");
        },
        child: const Text(" Navigator to Loctain Screen  "),
      ),
    );
  }
}
