part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

final class FilterLoading extends FilterState {}

final class FilterLoaded extends FilterState {
  final Filter filter;

  const FilterLoaded({
    this.filter = const Filter(),
  });
  @override
  List<Object> get props => [filter];
}
