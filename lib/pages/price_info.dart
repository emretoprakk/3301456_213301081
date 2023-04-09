import 'package:coffee_shop/components/square_info.dart';
import 'package:flutter/material.dart';

class PriceInfo extends StatelessWidget {
  final List _coffee = ["Long Black: 15TL","Cappuccino: 25TL","Espresso: 25TL","Iced Coffee: 35TL",
    "Latte: 25TL","Mocha: 20TL","White Mocha: 30TL",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Fiyat Bilgileri",style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.white10,
      body: ListView.builder(
          itemCount: _coffee.length,
          itemBuilder: (context, index) {
            return MySquare(child: _coffee[index],
            );
          }),
    );
  }
}