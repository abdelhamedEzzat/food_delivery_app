import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/model/category_filter_model.dart';
import 'package:food_delivery_app/model/price_filter_model.dart';

class Filter extends Equatable {
  final List<CategoryFilterModel> categoryFilter;
  final List<PriceFilterModel> priceFilter;

  const Filter(
      {this.categoryFilter = const <CategoryFilterModel>[],
      this.priceFilter = const <PriceFilterModel>[]});

  Filter copywith({
    List<CategoryFilterModel>? categoryFilter,
    List<PriceFilterModel>? priceFilter,
  }) {
    return Filter(
        categoryFilter: categoryFilter ?? this.categoryFilter,
        priceFilter: priceFilter ?? this.priceFilter);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [categoryFilter, priceFilter];
}
