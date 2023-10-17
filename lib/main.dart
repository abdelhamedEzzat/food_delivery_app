import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/bloc/basket/basket_bloc.dart';
import 'package:food_delivery_app/bloc/fillter/filter_bloc.dart';
import 'package:food_delivery_app/bloc/geolocation_bloc/goelocation_bloc.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/theme.dart';
import 'package:food_delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:food_delivery_app/repositories/places_repositories/places_repositories.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';

import 'bloc/auto_complete_bloc/auto_complete_bloc.dart';
import 'bloc/bloc_observer/bloc_observer.dart';
import 'bloc/place/place_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiRepositoryProvider(
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
              BlocProvider(
                  create: (context) => PlaceBloc(
                      placesRepository: context.read<PlacesRepository>())),
              BlocProvider(
                  create: (context) => FilterBloc()..add(FilterLoad())),
              BlocProvider(
                  create: (context) => BasketBloc()..add(StartBasket())),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme(),
              onGenerateRoute: AppRouter.onGeneratedRoute,
              initialRoute: HomeScreen.routeName,
            ),
          )),
    );
  }
}
