import 'package:coffee_shop/components/like_button.dart';
import 'package:flutter/material.dart';
import '../models/coffee.dart';

class FavCoffeeTile extends StatefulWidget {
  final Coffee favcoffee;

  FavCoffeeTile({super.key, required this.favcoffee,});

  @override
  State<FavCoffeeTile> createState() => _FavCoffeeTileState();
}

class _FavCoffeeTileState extends State<FavCoffeeTile> {

  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked =! isLiked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5), // 25 10
      child: ListTile(
        title: Text(widget.favcoffee.name),
        leading: Image.asset(widget.favcoffee.imagePath),
        trailing: LikeButton(
          isLiked: isLiked, onTap: toggleLike,
        ),
      ),
    );
  }
}