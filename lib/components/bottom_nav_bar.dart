import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key,required this.onTabChange,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: const  [
          GButton(
            icon: Icons.home,
            text: "Mağaza",
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Sepet",
          ),
          GButton(
            icon: Icons.favorite,
            text: "Favoriler",
          ),
          GButton(
            icon: Icons.info_outline,
            text: "Bilgi",
          ),
        ],
      ),
    );
  }
}