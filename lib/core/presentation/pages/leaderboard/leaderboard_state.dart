import '../../../../data/models/user_model.dart';


class LeaderboardState {
  final List<UserModel> users;
  final bool isLoading;
  final String? error;

  LeaderboardState({
    this.users = const [],
    this.isLoading = false,
    this.error,
  });
}