class RecipeInformationResponse {
  final String ingredient;
  final String credit;
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;
  final double rating;
  final String url;
  final List<IngredientsResponse> ingredients;

  RecipeInformationResponse(
      {required this.ingredient,
      required this.credit,
      required this.image,
      required this.rating,
      required this.readyInMinutes,
      required this.servings,
      required this.title,
      required this.url,
      required this.ingredients});

  factory RecipeInformationResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsJson = json['extendedIngredients'];
    List<IngredientsResponse> results = resultsJson
        .map((result) => IngredientsResponse.fromJson(result))
        .toList();

    return RecipeInformationResponse(
      ingredient: json['original'] as String,
      credit: json['creditsText'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      readyInMinutes: json['readyInMinutes'] as int,
      servings: json['servings'] as int,
      url: json['sourceUrl'] as String,
      rating: json['spoonacularScore'] as double,
      ingredients: results,
    );
  }
}

class IngredientsResponse {
  final String ingredient;

  IngredientsResponse({required this.ingredient});

  factory IngredientsResponse.fromJson(Map<String, dynamic> json) {
    return IngredientsResponse(ingredient: json['original']);
  }
}
