import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/core/presentation/pages/quiz/component/quiz_state.dart';
import 'package:demo2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../../../../data/models/quiz_model.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  Future<void> fetchQuestions(String categoryName) async {
    emit(QuizLoading());
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("QuizQuestions")
          .doc(categoryName)
          .get();
      if (snapshot.exists) {
        var data = snapshot.data();
        if (data != null && data.containsKey("questions")) {
          var questionMap = data['questions'] as Map<String, dynamic>;
          var fetchedQuestions = questionMap.entries
              .map((entry) => QuizQuestion.fromMap(entry.value))
              .toList();
          fetchedQuestions.shuffle();
          if (fetchedQuestions.length > 20) {
            fetchedQuestions = fetchedQuestions.sublist(0, 20);
          }
          emit(QuizLoaded(questions: fetchedQuestions));
        } else {
          emit(QuizError('No questions found'));
        }
      } else {
        emit(QuizError('Document does not exist'));
      }
    } catch (e) {
      emit(QuizError(e.toString()));
    }
  }

  void checkAnswer(int index) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final isCorrect =
          currentState.questions[currentState.currentIndex].correctKey ==
              index + 1;
      final newScore = isCorrect ? currentState.score + 1 : currentState.score;
      emit(QuizLoaded(
        questions: currentState.questions,
        currentIndex: currentState.currentIndex,
        score: newScore,
        selectedOption: index,
        hasAnswered: true,
      ));
    }
  }

  void nextQuestion() {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      if (currentState.currentIndex < currentState.questions.length - 1) {
        emit(QuizLoaded(
          questions: currentState.questions,
          currentIndex: currentState.currentIndex + 1,
          score: currentState.score,
          selectedOption: null,
          hasAnswered: false,
        ));
      } else {
        // Quiz đã hoàn thành, chuyển sang trạng thái QuizCompleted
        emit(QuizCompleted(
          questions: currentState.questions,
          score: currentState.score,
        ));
        updateUserScore();
      }
    }
  }

  Future<void> updateUserScore() async {
    // Chỉ cập nhật điểm khi trạng thái là QuizCompleted
    if (state is! QuizCompleted) {
      return;
    }

    final currentState = state as QuizCompleted;
    final score = currentState.score;

    // Lấy thông tin người dùng hiện tại
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(QuizError('Cannot update score: User not logged in'));
      return;
    }

    try {
      final userRef =
      FirebaseFirestore.instance.collection("userData").doc(user.uid);
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final snapshot = await transaction.get(userRef);
        if (!snapshot.exists) {
          // Nếu tài liệu chưa tồn tại, tạo mới với điểm ban đầu
          transaction.set(userRef, {'score': score});
        } else {
          // Nếu tài liệu đã tồn tại, cập nhật điểm
          int existingScore = snapshot.data()!['score'] ?? 0;
          transaction.update(userRef, {'score': existingScore + score});
        }
      });
    } catch (e) {
      MyApp.log.t('Error updating score: $e');
      emit(QuizError('Failed to update score: $e'));
    }
  }
}
