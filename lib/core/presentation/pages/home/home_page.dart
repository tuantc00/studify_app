import 'package:demo2/core/presentation/pages/leaderboard/leaderboard_page.dart';
import 'package:demo2/core/presentation/pages/profile/profile_page.dart';
import 'package:demo2/core/presentation/pages/quiz/quiz_categories_page.dart';
import 'package:demo2/core/resources/palette.dart';
import 'package:demo2/gen/assets.gen.dart';
import 'package:demo2/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageStorageBucket bucket = PageStorageBucket();
  final pages = [
    const QuizCategoriesPage(),
    Scaffold(body: Center(child: Text('Yêu thích'))),
    const LeaderboardPage(),
    ProfilePage(),
  ];
  late int selectIndex;

  @override
  void initState() {
    selectIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Material(
      child: Scaffold(
        body: PageStorage(bucket: bucket, child: pages[selectIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Assets.icons.homeIcon.svg(
                color: selectIndex == 0 ? Palette.primary : Palette.textButtonDisable,
              ),
              label: lang!.home,
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.favItem.svg(
                color: selectIndex == 1 ? Palette.primary : Palette.textButtonDisable,
              ),
              label: lang.favourite,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.leaderboard_rounded,
                color: selectIndex == 2 ? Palette.primary : Palette.textButtonDisable,
              ),
              label: lang.leaderBoard,
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.profile.svg(
                color: selectIndex == 3 ? Palette.primary : Palette.textButtonDisable,
              ),
              label: lang.profile,
            ),
          ],
          currentIndex: selectIndex,
          selectedIconTheme: IconThemeData(color: Palette.primary),
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.gray500,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              selectIndex = value;
            });
          },
        ),
      ),
    );
  }
}