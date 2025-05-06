import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../data/models/user_model.dart';
import 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit() : super(LeaderboardState(isLoading: true));

  void loadLeaderboard() {
    FirebaseFirestore.instance
        .collection('userData')
        .orderBy('score', descending: true)
        .snapshots()
        .listen((snapshot) {
      final users = snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      emit(LeaderboardState(users: users, isLoading: false));
    }, onError: (error) {
      emit(LeaderboardState(error: error.toString(), isLoading: false));
    });
  }
}