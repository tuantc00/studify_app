import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFF5F5F7);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color cardColor = Colors.white;
  static const Color darkCardColor = Color(0xFF1E1E1E);
  static const Color textColor = Color(0xFF333333);
  static const Color darkTextColor = Color(0xFFEEEEEE);
  static const Color subtitleColor = Color(0xFF6E6E6E);
  static const Color darkSubtitleColor = Color(0xFFB0B0B0);
  static const Color errorColor = Color(0xFFFF5252);
  static const Color successColor = Color(0xFF4CAF50);

  // TextStyles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    letterSpacing: 0.2,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    letterSpacing: 0.1,
  );

  // Button Styles
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  );

  static final ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: const BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  );

  // Input Decoration
  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: errorColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Colors.grey.shade500),
    labelStyle: TextStyle(color: Colors.grey.shade700),
  );

  // // Light Theme
  // static ThemeData get lightTheme => ThemeData(
  //   useMaterial3: true,
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: primaryColor,
  //     background: backgroundColor,
  //     onBackground: textColor,
  //     surface: cardColor,
  //     onSurface: textColor,
  //     error: errorColor,
  //   ),
  //   scaffoldBackgroundColor: backgroundColor,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: backgroundColor,
  //     foregroundColor: textColor,
  //     elevation: 0,
  //     centerTitle: true,
  //     titleTextStyle: TextStyle(
  //       color: textColor,
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   cardTheme: CardTheme(
  //     color: cardColor,
  //     elevation: 2,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
  //   outlinedButtonTheme: OutlinedButtonThemeData(style: secondaryButtonStyle),
  //   inputDecorationTheme: inputDecorationTheme,
  //   dividerTheme: const DividerThemeData(
  //     color: Color(0xFFEEEEEE),
  //     thickness: 1,
  //   ),
  //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     backgroundColor: Colors.white,
  //     selectedItemColor: primaryColor,
  //     unselectedItemColor: Colors.grey,
  //     showSelectedLabels: true,
  //     showUnselectedLabels: true,
  //     elevation: 8,
  //   ),
  // );
  //
  // // Dark Theme
  // static ThemeData get darkTheme => ThemeData(
  //   useMaterial3: true,
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: primaryColor,
  //     brightness: Brightness.dark,
  //     background: darkBackgroundColor,
  //     onBackground: darkTextColor,
  //     surface: darkCardColor,
  //     onSurface: darkTextColor,
  //     error: errorColor,
  //   ),
  //   scaffoldBackgroundColor: darkBackgroundColor,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: darkBackgroundColor,
  //     foregroundColor: darkTextColor,
  //     elevation: 0,
  //     centerTitle: true,
  //     titleTextStyle: TextStyle(
  //       color: darkTextColor,
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold,
  //     ),
  //   ),
  //   cardTheme: CardTheme(
  //     color: darkCardColor,
  //     elevation: 2,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
  //   outlinedButtonTheme: OutlinedButtonThemeData(style: secondaryButtonStyle),
  //   inputDecorationTheme: inputDecorationTheme.copyWith(
  //     fillColor: const Color(0xFF2A2A2A),
  //     hintStyle: TextStyle(color: Colors.grey.shade400),
  //     labelStyle: TextStyle(color: Colors.grey.shade300),
  //   ),
  //   dividerTheme: const DividerThemeData(
  //     color: Color(0xFF3A3A3A),
  //     thickness: 1,
  //   ),
  //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     backgroundColor: Color(0xFF1E1E1E),
  //     selectedItemColor: primaryColor,
  //     unselectedItemColor: Colors.grey,
  //     showSelectedLabels: true,
  //     showUnselectedLabels: true,
  //     elevation: 8,
  //   ),
  // );
}
