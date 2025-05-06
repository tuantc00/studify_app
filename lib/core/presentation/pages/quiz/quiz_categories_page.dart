import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/core/presentation/pages/quiz/component/quiz_question_page.dart';
import 'package:demo2/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizCategoriesPage extends StatefulWidget {
  const QuizCategoriesPage({super.key});

  @override
  State<QuizCategoriesPage> createState() => _QuizCategoriesPageState();
}

class _QuizCategoriesPageState extends State<QuizCategoriesPage> {
  final CollectionReference myQuiz = FirebaseFirestore.instance.collection("QuizQuestions");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: StreamBuilder(
          stream: myQuiz.snapshots(),
          builder: ( context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if( snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text('NO DATA'),
              );
            }
            return GridView.builder(
              itemCount: snapshot.data!.docs.length ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: ( context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizQuestionPage(categoryName: documentSnapshot['title'])));
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Palette.primary,
                      child: ClipRect(
                        child: Image.network(
                          height: 100.h,
                          documentSnapshot['image_url'],
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }
            );

          }

      ),
    );
  }
}
