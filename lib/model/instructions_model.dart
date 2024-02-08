class InstructionResponse {
  final List<Steps> step;

  InstructionResponse({
    required this.step,
  });

  factory InstructionResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultsJson = json['steps'];
    List<Steps> step =
        resultsJson.map((result) => Steps.fromJson(result)).toList();
    return InstructionResponse(step: step);
  }
}

class Steps {
  final int number;
  final String step;

  Steps({
    required this.number,
    required this.step,
  });

  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(
      number: json['number'] as int,
      step: json['step'] as String,
    );
  }
}
