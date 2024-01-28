import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nomster/model/instructions_model.dart';
import 'package:nomster/model/random_recipe_model.dart';
import 'package:nomster/model/recipe_information_model.dart';
import 'package:nomster/model/recipe_search_model.dart';

class ApiService {
  ApiService._instantiate();
  static final ApiService instance = ApiService._instantiate();

  final String _baseURL = "api.spoonacular.com";
  static const String API_KEY = "0f7c5b2a5af740599ca276d3108b994a";

  Future<RecipeSearchResponse> getRecipe(String searchQuery) async {
    Map<String, String> parameters = {
      'query': searchQuery,
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(_baseURL, '/recipes/complexSearch', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        RecipeSearchResponse recipeSearchResponse =
            RecipeSearchResponse.fromJson(data);
        return recipeSearchResponse;
      } else {
        // Handle non-200 status codes
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (error) {
      // Handle network errors
      throw 'Error: $error';
    }
  }

  final int numberOfRandomRecipes = 5;

  Future<RandomRecipeResponse> getRandomRecipe() async {
    Map<String, String> parameter = {
      'number': numberOfRandomRecipes.toString(),
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(_baseURL, '/recipes/random', parameter);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        RandomRecipeResponse randomRecipeResponse =
            RandomRecipeResponse.fromJson(data);
        return randomRecipeResponse;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (error) {
      throw 'Error: $error';
    }
  }

  Future<RecipeInformationResponse> getRecipeInformation(int id) async {
    Map<String, String> parameter = {
      'includeNutrition': 'false',
      'apiKey': API_KEY,
    };

    Uri uri =
        Uri.https(_baseURL, '/recipes/${id.toString()}/information', parameter);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        RecipeInformationResponse recipeInformationResponse =
            RecipeInformationResponse.fromJson(data);
        return recipeInformationResponse;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (error) {
      throw 'Error: $error';
    }
  }

  Future<InstructionResponse> getInstructions(int id) async {
    Map<String, String> parameter = {
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(
        _baseURL, '/recipes/${id.toString()}/analyzedInstructions', parameter);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        Map<String, String> data = jsonDecode(response.body);
        InstructionResponse instructionResponse =
            InstructionResponse.fromJson(data);
        return instructionResponse;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (error) {
      throw 'Error: $error';
    }
  }
}
