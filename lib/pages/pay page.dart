import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Ödeme Ekranı",style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: const Text(
          "Ödemeniz alınmıştır",
          style: TextStyle(color: Colors.white,fontSize: 30),

        ),
      ),
    );
  }
}