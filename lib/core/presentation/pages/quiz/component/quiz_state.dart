// Các trạng thái của Quiz
import '../../../../../data/models/quiz_model.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final int score;
  final int? selectedOption;
  final bool hasAnswered;

  QuizLoaded({
    required this.questions,
    this.currentIndex = 0,
    this.score = 0,
    this.selectedOption,
    this.hasAnswered = false,
  });
}

class QuizCompleted extends QuizState {
  final List<QuizQuestion> questions;
  final int score;

  QuizCompleted({
    required this.questions,
    required this.score,
  });
}

class QuizError extends QuizState {
  final String message;
  QuizError(this.message);
}