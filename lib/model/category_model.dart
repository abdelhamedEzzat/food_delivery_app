import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;

  const Category({required this.id, required this.name, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];

  static List<Category> categories = [
    Category(
        id: 1, name: "Pizza", image: Image.asset("assets/Images/pizza.png")),
    Category(
        id: 2, name: "Burger", image: Image.asset("assets/Images/burger.png")),
    Category(
        id: 3, name: "Saled", image: Image.asset("assets/Images/pancake.png")),
    Category(
        id: 4,
        name: "Dessert",
        image: Image.asset("assets/Images/avocado.png")),
    Category(
        id: 5, name: "Drink", image: Image.asset("assets/Images/juice.png")),
  ];
}
