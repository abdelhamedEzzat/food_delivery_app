import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/model/price_model.dart';

class PriceFilterModel extends Equatable {
  final int id;
  final Price price;
  final bool value;

  const PriceFilterModel(
      {required this.id, required this.price, required this.value});

  PriceFilterModel copyWith({
    int? id,
    Price? price,
    bool? value,
  }) {
    return PriceFilterModel(
        id: id ?? this.id,
        price: price ?? this.price,
        value: value ?? this.value);
  }

  @override
  // TODO: implement props

  List<Object?> get props => [id, price, value];
  static List<PriceFilterModel> filters = Price.prices
      .map((price) => PriceFilterModel(
            id: price.id,
            price: price,
            value: false,
          ))
      .toList();
}
