import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/place_autocomplete_model.dart';
import '../../repositories/places_repositories/places_repositories.dart';

part 'auto_complete_event.dart';
part 'auto_complete_state.dart';

class AutoCompleteBloc extends Bloc<AutoCompleteEvent, AutoCompleteState> {
  final PlacesRepository _placesRepository;

  StreamSubscription? _placesSubscription;

  AutoCompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutoCompleteLoading()) {
    on<LoadAutoComplete>((event, emit) async {
      try {
        _placesSubscription?.cancel();

        final List<PlaceAutoComplete> autoComplete =
            await _placesRepository.getAutoComplete(event.searchInput);

        emit(AutoCompleteLoaded(autoComplete: autoComplete));
      } on Exception catch (e) {
        print("error in search places map $e");
        // TODO
      }
    });
  }
}
