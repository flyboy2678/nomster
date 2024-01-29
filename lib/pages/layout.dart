import 'package:flutter/material.dart';
import 'package:nomster/components/bottom_navbar/bottom_navbar.dart';
import 'package:nomster/pages/grocery_list_page.dart';
import 'package:nomster/pages/home_page.dart';
import 'package:nomster/pages/favourite_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _HomePageState();
}

class _HomePageState extends State<Layout> {
  //this is to control the bottom navbar based on the selected index
  int _selectedIndex = 0;
  //This is to update the selected index based on what the user taps
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const FavouritesPage(),
    const GroceryListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
