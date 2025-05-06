import 'package:demo2/core/presentation/widgets/app_bar.dart';
import 'package:demo2/core/resources/palette.dart';
import 'package:demo2/core/resources/style.dart';
import 'package:demo2/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../config/locale_provider.dart';
import '../../../../gen/assets.gen.dart';
import 'profile_cubit.dart';
import 'profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isEnglish = localeProvider.locale.languageCode == 'en';
    final isDarkMode = themeProvider.isDarkMode;

    return BlocProvider(
      create: (context) => ProfileCubit()..fetchUser(),
      child: Material(
        child: Scaffold(
          appBar: BaseAppBar(label: lang!.profile),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // Listen for sign-out success or errors
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.pushReplacementNamed(context, '/signIn');
                }
                if (state.error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error!)),
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Palette.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            //onTap: () => context.read<ProfileCubit>().pickImage(),
                            onTap: (){},
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: state.user?.img != null
                                  ? NetworkImage(state.user!.img!)
                                  : AssetImage(Assets.icons.defaultAvatar.path)
                              as ImageProvider,
                              child: state.user?.img == null
                                  ? Assets.icons.defaultAvatar.svg()
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.mail.svg(),
                              const SizedBox(width: 2,),
                              Text(state.user!.userName,
                                style: semiBold16.copyWith(color: Palette.gray600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(state.user!.score.toString(),
                          style: semiBold16.copyWith(color: Palette.gray600)
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lang.language, style: semiBold14),
                        Row(
                          children: [
                            Text(
                              isEnglish ? lang.english : lang.vietNam,
                              style: semiBold14,
                            ),
                            const SizedBox(width: 10),
                            Switch(
                              value: isEnglish,
                              onChanged: (value) {
                                localeProvider
                                    .changeLanguage(value ? 'en' : 'vi');
                              },
                              activeColor: Palette.primary,
                              inactiveThumbColor: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lang.theme, style: semiBold14),
                        Row(
                          children: [
                            Text(
                              isDarkMode ? lang.darkMode : lang.lightMode,
                              style: semiBold14,
                            ),
                            const SizedBox(width: 10),
                            Switch(
                              value: isDarkMode,
                              onChanged: (value) {
                                themeProvider.toggleTheme(value);
                              },
                              activeColor: Palette.primary,
                              inactiveThumbColor: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lang.theme, style: semiBold14),
                        Row(
                          children: [
                            Text(
                              isDarkMode ? lang.darkMode : lang.lightMode,
                              style: semiBold14,
                            ),
                            const SizedBox(width: 10),
                            Switch(
                              value: isDarkMode,
                              onChanged: (value) {
                                themeProvider.toggleTheme(value);
                              },
                              activeColor: Palette.primary,
                              inactiveThumbColor: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<ProfileCubit>().signOut(),
                      child: Text(lang.logout),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  // Future<void> _showReminderTimePicker(BuildContext context) async {
  //   final TimeOfDay? selectedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (selectedTime != null) {
  //     context.read<ProfileCubit>().setReminderTime(selectedTime);
  //   }
  // }
}