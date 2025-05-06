import 'package:demo2/core/presentation/widgets/app_bar.dart';
import 'package:demo2/core/resources/palette.dart';
import 'package:demo2/core/resources/style.dart';
import 'package:demo2/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/user_model.dart';
import '../../../../gen/assets.gen.dart';
import 'leaderboard_cubit.dart';
import 'leaderboard_state.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => LeaderboardCubit()..loadLeaderboard(),
      child: Material(
        child: Scaffold(
          appBar: BaseAppBar(label: lang!.leaderBoard),
          body: BlocBuilder<LeaderboardCubit, LeaderboardState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.error != null) {
                return Center(child: Text('Error: ${state.error}'));
              }
              if (state.users.isEmpty) {
                return const Center(child: Text('No user found'));
              }
              final topThree = state.users.take(3).toList();
              final remainingUsers = state.users.skip(3).toList();
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Phần hiển thị top 3
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [Palette.primary, Palette.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: topThree.asMap().entries.map((entry) {
                          final index = entry.key;
                          final user = entry.value;
                          return _buildTopUserCard(user, index + 1);
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 9,),
                    Expanded(child: _buildUserList(remainingUsers)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTopUserCard(UserModel user, int rank) {
    final medals = ['🥇', '🥈', '🥉'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(medals[rank - 1], style: const TextStyle(fontSize: 40)),
        CircleAvatar(
          radius: 40,
          backgroundImage: user.img != null
              ? NetworkImage(user.img!)
              : const AssetImage('assets/images/placeholder.png') as ImageProvider,
        ),
        Text(
          user.userName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Score: ${user.score}'),
      ],
    );
  }

  Widget _buildUserList(List<UserModel> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 9.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: Palette.white,
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: user.img != null
                  ? NetworkImage(user.img!)
                  : AssetImage(Assets.icons.defaultAvatar.path) as ImageProvider,
            ),
            title: Text(user.userName),
            subtitle: Text('Score: ${user.score}'),
            trailing: Text(
              '${index + 4}th',
              style: semiBold18.copyWith(color: Palette.primary),
            ),
          ),
        );
      },
    );
  }
}