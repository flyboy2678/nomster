class InstructionResponse {
  final StepsResponse step;

  InstructionResponse({required this.step});

  factory InstructionResponse.fromJson(Map<String, dynamic> json) {
    return InstructionResponse(step: json['name']);
  }
}

class StepsResponse {
  final List<RecipeInstructions> results;

  StepsResponse({required this.results});

  factory StepsResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsJson = json['steps'];
    List<RecipeInstructions> results = resultsJson
        .map((result) => RecipeInstructions.fromJson(result))
        .toList();

    return StepsResponse(results: results);
  }
}

class RecipeInstructions {
  final int number;
  final String instruction;

  RecipeInstructions({
    required this.number,
    required this.instruction,
  });

  factory RecipeInstructions.fromJson(Map<String, dynamic> json) {
    return RecipeInstructions(
      number: json['number'] as int,
      instruction: json['step'] as String,
    );
  }
}
