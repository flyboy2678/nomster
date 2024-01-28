import 'package:flutter/cupertino.dart';
import 'package:nomster/model/random_recipe_model.dart';
import 'package:nomster/services/api_service.dart';

class RandomRecipeNotifier extends ChangeNotifier {
  RandomRecipeResponse? _randomRecipeResponse;

  RandomRecipeResponse? get recipeResponse => _randomRecipeResponse;

  Future<RandomRecipeResponse?> fetchRecipe() async {
    try {
      if (_randomRecipeResponse == null) {
        _randomRecipeResponse = await ApiService.instance.getRandomRecipe();
        notifyListeners();
      }
      return _randomRecipeResponse;
    } catch (error) {
      throw "error $error";
    }
  }
}
