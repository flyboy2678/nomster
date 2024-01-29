class RecipeSearchResponse {
  //list of Recipe Search objeccts containing recipeSearch data
  final List<RecipeSearch> results;

  RecipeSearchResponse({
    required this.results,
  });

  factory RecipeSearchResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsJson = json['results'];
    //copy the data fromt the dynamic list to the Listo
    List<RecipeSearch> results =
        resultsJson.map((result) => RecipeSearch.fromJson(result)).toList();

    return RecipeSearchResponse(
      results: results,
    );
  }
}

//store the data inside the results object
class RecipeSearch {
  final int id;
  final String title;
  final String image;
  final double rating;
  List<String> dishTypes;
  List<String> cuisines;

  RecipeSearch({
    required this.id,
    required this.title,
    required this.image,
    required this.cuisines,
    required this.dishTypes,
    required this.rating,
  });

  factory RecipeSearch.fromJson(Map<String, dynamic> json) {
    List<dynamic> cuisinesJson = json['cuisines'];
    List<String> cuisines = List<String>.from(cuisinesJson);
    List<dynamic> dishTypesJson = json['dishTypes'];
    List<String> dishTypes = List<String>.from(dishTypesJson);

    return RecipeSearch(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      rating: json['spoonacularScore'] as double,
      dishTypes: dishTypes,
      cuisines: cuisines,
    );
  }
}
