import 'package:equatable/equatable.dart';

import 'menu_items_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItem;
  final int deliveryTime;
  final double dilevreyFee;
  final double distance;

  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.deliveryTime,
    required this.dilevreyFee,
    required this.distance,
    required this.menuItem,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, imageUrl, name, tags, deliveryTime, dilevreyFee, distance];

  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        imageUrl:
            'https://images.unsplash.com/photo-1560008581-09826d1de69e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1944&q=80',
        name: "Golden ice Gelato",
        tags: const ["Italian , Dessert , iceCream"],
        deliveryTime: 30,
        dilevreyFee: 2.99,
        distance: 0.1,
        menuItem: MenuItem.menusItem
            .where((menuItem) => menuItem.restaurantID == 1)
            .toList()),
    Restaurant(
        id: 2,
        imageUrl:
            'https://images.unsplash.com/photo-1560008581-09826d1de69e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1944&q=80',
        name: "Golden ice Gelato",
        tags: const ["Italian , Dessert , iceCream"],
        deliveryTime: 30,
        dilevreyFee: 2.99,
        distance: 0.1,
        menuItem: MenuItem.menusItem
            .where((menuItem) => menuItem.restaurantID == 2)
            .toList()),
    Restaurant(
        id: 3,
        imageUrl:
            'https://images.unsplash.com/photo-1514517220017-8ce97a34a7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
        name: "Golden ice Gelato",
        tags: const ["Italian , Dessert , iceCream"],
        deliveryTime: 30,
        dilevreyFee: 2.99,
        distance: 0.1,
        menuItem: MenuItem.menusItem
            .where((menuItem) => menuItem.restaurantID == 3)
            .toList()),
    Restaurant(
        id: 4,
        imageUrl:
            'https://images.unsplash.com/photo-1560008581-09826d1de69e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1944&q=80',
        name: "Golden ice Gelato",
        tags: const ["Italian , Dessert , iceCream"],
        deliveryTime: 30,
        dilevreyFee: 2.99,
        distance: 0.1,
        menuItem: MenuItem.menusItem
            .where((menuItem) => menuItem.restaurantID == 4)
            .toList()),
  ];
}
