// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nomster/components/home_page/categories_section.dart';
import 'package:nomster/components/home_page/home_recipe_card.dart';
import 'package:nomster/components/home_page/search_section.dart';
import 'package:nomster/model/random_recipe_model.dart';
import 'package:nomster/provider/random_recipe_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<RandomRecipeResponse?> recipeFuture;

  @override
  void initState() {
    super.initState();
    recipeFuture =
        Provider.of<RandomRecipeNotifier>(context, listen: false).fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: Text(
          "Nomster",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchSection(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Text(
              "Special Picks for You",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          FutureBuilder<RandomRecipeResponse?>(
            future: recipeFuture,
            builder: (context, snapshot) {
              //check if api data is done loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                //display circular loading while data is loading
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                //display error if data didnt load
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<RandomRecipe> recipes = snapshot.data!.results;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      RandomRecipe recipe = recipes[index];
                      return HomeRecipeCard(
                          image: recipe.image,
                          title: recipe.title,
                          rating: recipe.rating.round().toString(),
                          id: recipe.id,
                          cuisine: recipe.cuisines,
                          dishType: recipe.dishTypes);
                    },
                  ),
                );
              } else {
                return Text('No data available');
              }
            },
          ),
          CategoriesSection(),
        ],
      ),
    );
  }
}
