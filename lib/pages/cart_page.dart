
import 'package:coffee_shop/pages/pay%20page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffee_tile.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {

  // remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  // pay button tapped
  void payNow() {
    /*

    fill out your payment service here

     */
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [

            // heading
            Text(
              "Sepetin",
              style: TextStyle(fontSize: 20,color: Colors.white), // yazı rengi
            ),
            const SizedBox(height: 25), // your kart yazısının kutulara uzaklıgı

            // list of cart items
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                  // get individual cart items
                  Coffee eachCoffee = value.userCart[index];

                  // return coffee tile
                  return CoffeeTile(
                    coffee: eachCoffee,
                    onPressed: () => removeFromCart(eachCoffee),
                    icon: Icon(Icons.delete),
                  );
                },
              ),
            ),

            // pay button
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                 MaterialPageRoute(
                     builder: (context) => PayPage(),
                 ),
                  ),
              child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Ödeme Ekranı",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}