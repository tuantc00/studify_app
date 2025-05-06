import 'package:demo2/core/presentation/pages/quiz/component/quiz_cubit.dart';
import 'package:demo2/core/presentation/pages/quiz/component/quiz_state.dart';
import 'package:demo2/core/presentation/widgets/custome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo2/core/presentation/widgets/app_bar.dart';
import 'package:demo2/core/resources/palette.dart';
import 'package:demo2/core/resources/style.dart';

import '../../../../../l10n/app_localizations.dart';

class QuizQuestionPage extends StatelessWidget {
  final String categoryName;

  const QuizQuestionPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => QuizCubit()..fetchQuestions(categoryName),
      child: Scaffold(
        appBar: BaseAppBar(label: categoryName, onQuiz: true,),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizLoaded) {
              final currentQuestion = state.questions[state.currentIndex];
              return Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: (state.currentIndex + 1) / state.questions.length,
                      backgroundColor: Palette.gray100,
                      minHeight: 8,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Palette.gray100,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        "Câu ${state.currentIndex + 1} : ${currentQuestion.questionText} ",
                        style: semiBold18,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            _buildOption(context, index, state),
                        separatorBuilder: (_, __) => const SizedBox(height: 15),
                        itemCount: currentQuestion.options.length,
                      ),
                    ),
                    if (state.hasAnswered)
                      ElevatedButton(
                        onPressed: () =>
                            context.read<QuizCubit>().nextQuestion(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.primary,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          state.currentIndex == state.questions.length - 1
                              ? lang!.finish
                              : lang!.next,
                          style: semiBold18.copyWith(color: Colors.white),
                        ),
                      ),
                  ],
                ),
              );
            } else if (state is QuizError) {
              return Center(child: Text(state.message));
            } else if (state is QuizCompleted) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    textButtonRight: lang!.leaderBoard,
                    textButtonLeft: lang!.close,
                    isSingle: false,
                    isPositive: true,
                    title: lang.congratContent,
                    content: '${lang.yourResult} : ${state.score }/${state.questions.length}',
                    onButtonLeft: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    onButtonRight: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                );
              });

            }
            return const Center(child: Text('No Question Available'));
          },
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, int index, QuizLoaded state) {
    final currentQuestion = state.questions[state.currentIndex];
    bool isCorrect = currentQuestion.correctKey == index + 1;
    bool isSelected = state.selectedOption == index;

    Color? bgColor = state.hasAnswered
        ? (isCorrect
        ? Palette.primary
        : isSelected
        ? Palette.errorText
        : Colors.grey.shade200)
        : Colors.grey.shade200;

    Color textColor = state.hasAnswered && (isCorrect || isSelected)
        ? Colors.white
        : Colors.black;

    return InkWell(
      onTap: state.hasAnswered
          ? null
          : () => context.read<QuizCubit>().checkAnswer(index),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Palette.gray100,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          currentQuestion.options[index],
          textAlign: TextAlign.center,
          style: semiBold18.copyWith(color: textColor),
        ),
      ),
    );
  }
}