part of 'place_bloc.dart';

sealed class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

final class Placeloading extends PlaceState {}

final class Placeloaded extends PlaceState {
  final Place place;

  Placeloaded({required this.place});
  @override
  List<Object> get props => [place];
}

final class PlaceloadError extends PlaceState {}
