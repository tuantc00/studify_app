import 'package:demo2/config/routes.dart';
import 'package:demo2/core/presentation/pages/home/home_page.dart';
import 'package:demo2/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'config/app_theme.dart';
import 'core/presentation/pages/sign_in/sign_in_page.dart';
import 'core/resources/style.dart';
import 'l10n/app_localizations.dart';
import 'config/locale_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static Logger log = Logger();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, localeProvider, themeProvider, child) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: themeData,
                darkTheme: darkTheme,
                themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                initialRoute: AppRoute.signIn,
                onGenerateRoute: AppRoute.generateRoute,
                locale: localeProvider.locale,
                home: StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        return const HomePage();
                      } else {
                        return const SignInPage();
                      }
                    }
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}