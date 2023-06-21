import 'package:coffee_shop/components/fav_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffee_tile.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //heading message
            const Text(
              "Favori Kahveler",
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),

            const SizedBox(height: 25), // kutulara uzaklıgı

            //list of coffee to buy
            Expanded(
              child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
                  //get individual coffee
                  Coffee eachCoffee = value.coffeeShop[index];
                  //return the tile for this coffee
                  return FavCoffeeTile(
                    favcoffee: eachCoffee,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}