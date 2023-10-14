part of 'goelocation_bloc.dart';

class GoelocationEvent extends Equatable {
  const GoelocationEvent();

  @override
  List<Object?> get props => [];
}

class LoadGeoLocation extends GoelocationEvent {}

class UpdateGeoLocation extends GoelocationEvent {
  final Position position;

  const UpdateGeoLocation({required this.position});
  @override
  List<Object?> get props => [position];
}
