import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = "VoucherScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const VoucherScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const VoucherScreen({super.key});

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
