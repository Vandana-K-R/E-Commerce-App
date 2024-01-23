import 'package:flutter/material.dart';
import 'package:sushishop/models/food_model.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: 'Salmon Sushi',
        price: '21.0',
        imagePath: 'assets/images/salmon_sushi.png',
        rating: '5'),
    Food(
        name: 'Tuna',
        price: '25.0',
        imagePath: 'assets/images/tuna.png',
        rating: '4.5'),
    Food(
        name: 'Tuna',
        price: '25.0',
        imagePath: 'assets/images/salmon_eggs.png',
        rating: '4.5')
  ];

  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
