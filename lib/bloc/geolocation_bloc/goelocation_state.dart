part of 'goelocation_bloc.dart';

abstract class GoelocationState extends Equatable {
  const GoelocationState();
  @override
  List<Object> get props => [];
}

final class GoelocationInitial extends GoelocationState {}

final class GoelocationLoading extends GoelocationState {}

final class GoelocationLoaded extends GoelocationState {
  final Position position;

  const GoelocationLoaded({required this.position});
  @override
  List<Object> get props => [position];
}

final class Goelocationerror extends GoelocationState {}
