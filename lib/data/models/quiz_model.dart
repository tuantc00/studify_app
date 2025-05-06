class QuizQuestion {
  final String questionText;
  final List<String> options;
  final int correctKey;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctKey,
  });

  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    var optionsMap = map['options'] as Map<String, dynamic>;
    var optionList = optionsMap.entries.toList()
      ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));
    var options = optionList.map((e) => e.value.toString()).toList();

    return QuizQuestion(
      questionText: map['questionText'] ?? 'No Question',
      options: options,
      correctKey: int.tryParse(map['correctKey'].toString()) ?? 0,
    );
  }
}