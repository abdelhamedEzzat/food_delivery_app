import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/model/category_filter_model.dart';
import 'package:food_delivery_app/model/filter_madel.dart';
import 'package:food_delivery_app/model/price_filter_model.dart';
import 'package:food_delivery_app/model/restaurant_model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading()) {
    on<FilterLoad>(_onLoadFilter);
    on<CategoryFillterUpdated>(_onUpdateCategoryFilter);
    on<PriceFillterUpdated>(_onUpdatePriceFilter);
  }
  void _onLoadFilter(
    FilterLoad event,
    Emitter<FilterState> emit,
  ) async {
    emit(
      FilterLoaded(
        filter: Filter(
          categoryFilter: CategoryFilterModel.filters,
          priceFilter: PriceFilterModel.filters,
        ),
      ),
    );
  }

  void _onUpdateCategoryFilter(
    CategoryFillterUpdated event,
    Emitter<FilterState> emit,
  ) async {
    final state = this.state;

    if (state is FilterLoaded) {
      final List<CategoryFilterModel> updatedCategoryFilters =
          state.filter.categoryFilter.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      var categories = updatedCategoryFilters
          .where((filter) => filter.value)
          .map((filter) => filter.category)
          .toList();

      var prices = state.filter.priceFilter
          .where((filter) => filter.value)
          .map((filter) => filter.price.price)
          .toList();

      // List<Restaurant> filteredRestaurants = _getFilteredRestaurants(
      //   categories,
      //   prices,
      // );

      emit(
        FilterLoaded(
          filter: Filter(
            categoryFilter: updatedCategoryFilters,
            priceFilter: state.filter.priceFilter,
          ),
          // filteredRestaurants: filteredRestaurants,
        ),
      );
    }
  }

  void _onUpdatePriceFilter(
    PriceFillterUpdated event,
    Emitter<FilterState> emit,
  ) async {
    final state = this.state;

    if (state is FilterLoaded) {
      final List<PriceFilterModel> updatedPriceFilters =
          state.filter.priceFilter.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      var categories = state.filter.categoryFilter
          .where((filter) => filter.value)
          .map((filter) => filter.category)
          .toList();

      var prices = updatedPriceFilters
          .where((filter) => filter.value)
          .map((filter) => filter.price.price)
          .toList();

      // List<Restaurant> filteredRestaurants = _getFilteredRestaurants(
      //   categories,
      //   prices,
      // );

      emit(
        FilterLoaded(
          filter: Filter(
            categoryFilter: state.filter.categoryFilter,
            priceFilter: updatedPriceFilters,
          ),
          //   filteredRestaurants: filteredRestaurants,
        ),
      );
    }
  }

  // List<Restaurant> _getFilteredRestaurants(
  //   List<Category> categories,
  //   List<String> prices,
  // ) {
  //   return (_restaurantsBloc.state as RestaurantsLoaded)
  //       .restaurants
  //       .where(
  //         (restaurant) => categories.any(
  //           (category) => restaurant.categories.contains(category),
  //         ),
  //       )
  //       .where(
  //         (restaurant) => prices.any(
  //           (price) => restaurant.priceCategory.contains(price),
  //         ),
  //       )
  //       .toList();
  // }
}








//     on<CategoryFillterUpdated>((
//       event,
//       emit,
//     ) {
//       FilterState? state;
//       if (state is FilterLoaded) {
//         final List<CategoryFilterModel> updatedCategoryFillter =
//             state.filter.categoryFilter.map((categoryFilter) {
//           return categoryFilter.id == event.categoryFilter.id
//               ? event.categoryFilter
//               : categoryFilter;
//         }).toList();

//         emit(FilterLoaded(
//             filter: Filter(
//                 categoryFilter: updatedCategoryFillter,
//                 priceFilter: state.filter.priceFilter)));
//       }
//     });
//     on<PriceFillterUpdated>((
//       event,
//       emit,
//     ) {
//       FilterState? state;
//       if (state is FilterLoaded) {
//         final List<PriceFilterModel> updatedPriceFillter =
//             state.filter.priceFilter.map((priceFilter) {
//           return priceFilter.id == event.priceFilter.id
//               ? event.priceFilter
//               : priceFilter;
//         }).toList();

//         emit(FilterLoaded(
//             filter: Filter(
//                 categoryFilter: state.filter.categoryFilter,
//                 priceFilter: updatedPriceFillter)));
//       }
//     });
//   }
// }
