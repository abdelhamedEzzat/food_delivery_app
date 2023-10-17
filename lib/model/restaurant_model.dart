import 'package:equatable/equatable.dart';

import 'menu_items_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  Restaurant({
    required this.priceCategory,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
    required this.menuItems,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        tags,
        deliveryTime,
        deliveryFee,
        distance,
        priceCategory,
        menuItems
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        imageUrl:
            'https://images.unsplash.com/photo-1542834369-f10ebf06d3e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        name: "Golden ice Gelato",
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        deliveryTime: 30,
        deliveryFee: 2.99,
        priceCategory: '\$',
        distance: 0.1,
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList()),
    Restaurant(
        id: 2,
        imageUrl:
            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        name: "Golden ice Gelato",
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        deliveryTime: 30,
        deliveryFee: 2.99,
        priceCategory: '\$',
        distance: 0.1,
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList()),
    Restaurant(
        id: 3,
        imageUrl:
            'https://images.unsplash.com/photo-1525059696034-4967a8e1dca2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1976&q=80',
        name: "Golden ice Gelato",
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        deliveryTime: 30,
        priceCategory: '\$',
        deliveryFee: 2.99,
        distance: 0.1,
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList()),
    Restaurant(
        id: 4,
        imageUrl:
            'https://images.unsplash.com/photo-1560008581-09826d1de69e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1944&q=80',
        name: "Golden ice Gelato",
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        deliveryTime: 30,
        priceCategory: '\$',
        deliveryFee: 2.99,
        distance: 0.1,
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList()),
  ];
}
