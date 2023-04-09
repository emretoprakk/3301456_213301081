import 'package:flutter/material.dart';

import '../models/coffee.dart';

class FavCoffeeTile extends StatelessWidget {
  final Coffee favcoffee;

   FavCoffeeTile({super.key, required this.favcoffee,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5), // 25 10
      child: ListTile(
        title: Text(favcoffee.name),
        leading: Image.asset(favcoffee.imagePath),
        trailing: Icon(Icons.favorite),
      ),
    );
  }
}