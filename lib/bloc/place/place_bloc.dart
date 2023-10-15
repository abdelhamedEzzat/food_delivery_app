import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/model/place_model.dart';
import 'package:food_delivery_app/repositories/places_repositories/places_repositories.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository _placeRepository;
  StreamSubscription? _placeSubscription;

  PlaceBloc({required PlacesRepository placesRepository})
      : _placeRepository = placesRepository,
        super(Placeloading()) {
    on<LoadPlace>((event, emit) async {
      emit(Placeloading());
      try {
        _placeSubscription?.cancel();
        final Place place = await _placeRepository.getPlace(event.placeId);
        emit(Placeloaded(place: place));
      } catch (e) {
        print("error in placeB $e");
      }
    });
    Future<void> close() {
      _placeSubscription?.cancel();
      return super.close();
    }
  }
}
