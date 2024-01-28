// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: GNav(
          color: Colors.orange[100],
          activeColor: Colors.orange,

          // tabBackgroundColor: Colors.orange.shade100,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 10,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favorite',
            ),
            GButton(
              icon: Icons.shopping_basket,
              text: 'Grocery List',
            ),
          ]),
    );
  }
}
