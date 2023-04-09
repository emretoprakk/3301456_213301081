import 'package:coffee_shop/components/square_info.dart';
import 'package:flutter/material.dart';

class CoffeeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kahvelerimiz"),
        backgroundColor: Colors.black,
      ),
        backgroundColor: Colors.white10,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                color: Colors.white10,
                child: Image.asset("lib/images/iced_coffee.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                color: Colors.white10,
                child: Image.asset("lib/images/latte.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                color: Colors.white10,
                child: Image.asset("lib/images/whitemocha.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                color: Colors.white10,
                child: Image.asset("lib/images/mocha.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                color: Colors.white10,
                child: Image.asset("lib/images/black.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                color: Colors.white10,
                child: Image.asset("lib/images/espresso.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 200,
                color: Colors.white10,
                child: Image.asset("lib/images/cappuccino.png"),
              ),
            ),
          ],
        )
    );
  }
}