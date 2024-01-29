import 'package:flutter/material.dart';
import 'package:nomster/components/search_results_page/recipe_result_card.dart';
import 'package:nomster/model/recipe_search_model.dart';

class SearchResultsPage extends StatelessWidget {
  final RecipeSearchResponse recipeSearchResponse;
  final String searchQuery;
  const SearchResultsPage(
      {super.key,
      required this.recipeSearchResponse,
      required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    List<RecipeSearch> recipes = recipeSearchResponse.results;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: Text("Results for $searchQuery"),
        ),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              RecipeSearch recipe = recipes[index];
              return RecipeResultCard(
                id: recipe.id,
                image: recipe.image,
                title: recipe.title,
                rating: recipe.rating,
                dishType: recipe.dishTypes,
                cuisine: recipe.cuisines,
              );
            }));
  }
}
