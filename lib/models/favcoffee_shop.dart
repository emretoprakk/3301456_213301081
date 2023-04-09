import 'package:flutter/material.dart';
import 'coffee.dart';
import 'favcoffee.dart';

class FavCoffeeShop extends ChangeNotifier {

  final List<FavCoffee> _fav = [
  FavCoffee(
  name: "Cappuccino",
  imagePath: 'lib/images/cappuccino.png',
  ),
  FavCoffee(
  name: "Iced Coffee",
  imagePath: 'lib/images/iced_coffee.png',
  ),
  FavCoffee(
  name: "Espresso",
  imagePath: 'lib/images/espresso.png',
  ),
  FavCoffee(
  name: "Latte",
  imagePath: 'lib/images/latte.png',
  ),
  ];

  List<FavCoffee> _userFav = [];

  //get coffee list
  List<FavCoffee> get favcoffeeShop => _fav;

  //get user cart
  List<FavCoffee> get userFav => _userFav;


}