import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

part 'goelocation_event.dart';
part 'goelocation_state.dart';

class GoelocationBloc extends Bloc<GoelocationEvent, GoelocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geoLocationSubscription;

  GoelocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GoelocationLoading()) {
    on<LoadGeoLocation>(
      (event, emit) async {
        final position = await _geolocationRepository.getCurrentLocation();
        emit(GoelocationLoaded(position: position));
      },
    );

    on<UpdateGeoLocation>((event, emit) {
      emit(GoelocationLoaded(position: event.position));
    });
  }

  @override
  Future<void> close() {
    _geoLocationSubscription?.cancel();
    return super.close();
  }
}

























//   @override
//   Stream<GoelocationState> mapEventToState(GoelocationEvent event) async* {
//     if (event is LoadGeoLocation) {
//       yield* _mapLoadGeolocationToState();
//     } else if (event is UpdateGeoLocation) {
//       yield* _mapUpdateGeolocationState(event);
//     }
//   }

//   Stream<GoelocationState> _mapLoadGeolocationToState() async* {
//     _geoLocationSubscription?.cancel();
//     final Position position = await _geolocationRepository.getCurrentLocation();
//     add(UpdateGeoLocation(position: position));
//   }

//   Stream<GoelocationState> _mapUpdateGeolocationState(
//       UpdateGeoLocation event) async* {
//     yield GoelocationLoaded(position: event.position);
//   }

//   Future<void> close() {
//     _geoLocationSubscription?.cancel();
//     return super.close();
//   }
// }
