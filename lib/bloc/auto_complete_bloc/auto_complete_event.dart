part of 'auto_complete_bloc.dart';

sealed class AutoCompleteEvent extends Equatable {
  const AutoCompleteEvent();

  @override
  List<Object> get props => [];
}

final class LoadAutoComplete extends AutoCompleteEvent {
  final String searchInput;

  const LoadAutoComplete({this.searchInput = " "});
  @override
  List<Object> get props => [searchInput];
}
