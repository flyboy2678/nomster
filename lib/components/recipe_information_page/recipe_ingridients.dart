import 'package:flutter/material.dart';
import 'package:nomster/model/recipe_information_model.dart';

class RecipeIngredients extends StatelessWidget {
  final List<IngredientsResponse> ingredients;

  const RecipeIngredients({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ingredients",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                        width: 10), // Add some spacing between icon and text
                    Container(
                      width: width * 0.8,
                      child: Text(
                        ingredients[index].ingredient,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
