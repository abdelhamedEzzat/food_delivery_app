part of 'auto_complete_bloc.dart';

sealed class AutoCompleteState extends Equatable {
  const AutoCompleteState();

  @override
  List<Object> get props => [];
}

final class AutoCompleteInitial extends AutoCompleteState {}

final class AutoCompleteLoading extends AutoCompleteState {}

final class AutoCompleteLoaded extends AutoCompleteState {
  final List<PlaceAutoComplete> autoComplete;

  const AutoCompleteLoaded({required this.autoComplete});
  @override
  List<Object> get props => [autoComplete];
}

final class AutoCompleteError extends AutoCompleteState {}
