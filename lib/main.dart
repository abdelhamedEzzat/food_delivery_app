import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/app_router.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRouter.onGeneratedRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
