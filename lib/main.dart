import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/geolocation_bloc/goelocation_bloc.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/theme.dart';
import 'package:food_delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:food_delivery_app/repositories/places_repositories/places_repositories.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';

import 'bloc/auto_complete_bloc/auto_complete_bloc.dart';
import 'bloc/bloc_observer/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GeolocationRepository>(
              create: (_) => GeolocationRepository()),
          //
          //
          RepositoryProvider<PlacesRepository>(
              create: (_) => PlacesRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GoelocationBloc(
                    geolocationRepository:
                        context.read<GeolocationRepository>())
                  ..add(LoadGeoLocation())),
            BlocProvider(
                create: (context) => AutoCompleteBloc(
                    placesRepository: context.read<PlacesRepository>())
                  ..add(const LoadAutoComplete())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGeneratedRoute,
            initialRoute: LocationScreen.routeName,
          ),
        ));
  }
}
