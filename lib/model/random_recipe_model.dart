class RandomRecipeResponse {
  final List<RandomRecipe> results;

  RandomRecipeResponse({
    required this.results,
  });

  factory RandomRecipeResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsJson = json['recipes'];
    List<RandomRecipe> results =
        resultsJson.map((results) => RandomRecipe.fromJson(results)).toList();
    return RandomRecipeResponse(results: results);
  }
}

class RandomRecipe {
  final int id;
  final double rating;
  final String title;
  final String image;
  final List<String> cuisines;
  final List<String> dishTypes;

  RandomRecipe(
      {required this.id,
      required this.title,
      required this.image,
      required this.cuisines,
      required this.dishTypes,
      required this.rating});

  factory RandomRecipe.fromJson(Map<String, dynamic> json) {
    List<dynamic> cuisinesJson = json['cuisines'];
    List<String> cuisines = List<String>.from(cuisinesJson);
    List<dynamic> dishTypesJson = json['dishTypes'];
    List<String> dishTypes = List<String>.from(dishTypesJson);

    return RandomRecipe(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String,
        cuisines: cuisines,
        dishTypes: dishTypes,
        rating: json['spoonacularScore'] as double);
  }
}
