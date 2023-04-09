import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {

  //coffee for sale list
  final List<Coffee> _shop = [
    Coffee(
      name: "White Mocha",
      //price: "8",
      imagePath: "lib/images/whitemocha.png",
    ),
    //iced coffee

    Coffee(
      name: "Iced Coffee",
      //price: "10",
      imagePath: "lib/images/iced_coffee.png",
    ),
    //latte
    Coffee(
      name: "Latte",
      //price: "6",
      imagePath: "lib/images/latte.png",
    ),

    //espresso
    Coffee(
      name: "Espresso",
      // price: "6",
      imagePath: "lib/images/espresso.png",
    ),
    //black coffee
    Coffee(
      name: "Long Black",
      //price: "4",
      imagePath: "lib/images/black.png",
    ),
    Coffee(
      name: "Mocha",
      // price: "7",
      imagePath: "lib/images/mocha.png",
    ),
    Coffee(
      name: "Cappuccino",
      //price: "6",
      imagePath: "lib/images/cappuccino.png",
    ),
  ];

  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;


  //add item to cart
  void addItemToFavorite(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }
  //remove item to cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}