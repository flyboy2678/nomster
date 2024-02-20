import 'package:flutter/material.dart';
import 'package:nomster/model/recipe_search_model.dart';
import 'package:nomster/pages/search_results_page.dart';
import 'package:nomster/services/api_service.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    void handleSearch(String query, String type) async {
      RecipeSearchResponse recipeSearchResponse;
      type == 'type'
          ? recipeSearchResponse =
              await ApiService.instance.getRecipeType(query)
          : recipeSearchResponse =
              await ApiService.instance.getRecipeCuisine(query);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(
            recipeSearchResponse: recipeSearchResponse,
            searchQuery: query,
          ),
        ),
      );
    }

    void goToCategoriesPage() async {
      //logic here....
    }

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
              GestureDetector(
                onTap: () {
                  handleSearch('breakfast', 'type');
                },
                child: Column(
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
              ),
              GestureDetector(
                onTap: () {
                  handleSearch('lunch', 'type');
                },
                child: Column(
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
              ),
              GestureDetector(
                onTap: () {
                  handleSearch('main course', 'type');
                },
                child: Column(
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
              ),
              //TODO : change this category to something else
              GestureDetector(
                onTap: () {
                  handleSearch('breakfast', 'type');
                },
                child: Column(
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
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  handleSearch('snack', 'type');
                },
                child: Column(
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
              ),
              GestureDetector(
                onTap: () {
                  handleSearch('dessert', 'type');
                },
                child: Column(
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
              ),
              //TODO : Change this also
              GestureDetector(
                onTap: () {
                  handleSearch('breakfast', 'type');
                },
                child: Column(
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
              ),
              GestureDetector(
                onTap: () {
                  goToCategoriesPage();
                },
                child: Column(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
