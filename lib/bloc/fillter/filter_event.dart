// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterLoad extends FilterEvent {
  @override
  List<Object> get props => [];
}

class CategoryFillterUpdated extends FilterEvent {
  final CategoryFilterModel categoryFilter;
  const CategoryFillterUpdated({
    required this.categoryFilter,
  });

  @override
  List<Object> get props => [categoryFilter];
}

class PriceFillterUpdated extends FilterEvent {
  final PriceFilterModel priceFilter;
  const PriceFillterUpdated({
    required this.priceFilter,
  });

  @override
  List<Object> get props => [priceFilter];
}
