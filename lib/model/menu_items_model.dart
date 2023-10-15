import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantID;
  final String name;
  final String description;
  final double price;
  // final String imageUrl;
  MenuItem(
      {required this.id,
      required this.restaurantID,
      required this.name,
      required this.description,
      required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [id, restaurantID, name, description, price];

  static List<MenuItem> menusItem = [
    MenuItem(
        id: 1,
        restaurantID: 1,
        name: 'Pizza',
        description: 'Pizza with Tomatos',
        price: 5.99),
    MenuItem(
        id: 2,
        restaurantID: 1,
        name: 'Coca Cola',
        description: 'A cold deveradge',
        price: 1.99)
  ];
}
