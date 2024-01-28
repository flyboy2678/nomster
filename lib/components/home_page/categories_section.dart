import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose by Category",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink.shade300,
                    ),
                    child: Icon(
                      Icons.coffee_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Breakfast"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple.shade300,
                    ),
                    child: Icon(
                      Icons.lunch_dining_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Lunch"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange.shade300,
                    ),
                    child: Icon(
                      Icons.dinner_dining_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Dinner"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade300,
                    ),
                    child: Icon(
                      Icons.local_pizza_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Pizza"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple.shade300,
                    ),
                    child: Icon(
                      Icons.cookie_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Snack"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade300,
                    ),
                    child: Icon(
                      Icons.cake_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Dessert"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange.shade300,
                    ),
                    child: Icon(
                      Icons.egg_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Protein"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo.shade300,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("More"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
