import 'package:demo2/core/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constant.dart';

final ThemeData themeData = ThemeData(
  primaryColor: Palette.primary,
  primaryColorDark: Palette.primaryDark,
  primaryColorLight: Palette.bgScreen,
  iconTheme: iconThemeData,
  appBarTheme: appBarTheme,
  buttonTheme: buttonThemeData,
  disabledColor: Palette.disable,
  scaffoldBackgroundColor: Palette.bgScreen,
  dialogTheme: dialogTheme,
  bottomSheetTheme: bottomSheetTheme,
  indicatorColor: Palette.primary,
  textTheme: textTheme,
  checkboxTheme: checkboxTheme,
  listTileTheme: listTileThemeData,
  radioTheme: radioThemeData,
  switchTheme: switchThemeData,
  timePickerTheme: timePickerThemeData,
  datePickerTheme: datePickerThemeData,
  textButtonTheme: textButtonThemeData,
  elevatedButtonTheme: elevatedButtonThemeData,
  outlinedButtonTheme: outlinedButtonThemeData,
  drawerTheme: drawerThemeData,
  inputDecorationTheme: inputDecorationTheme,
  navigationBarTheme: bottomNavigationBarThemeData,
  progressIndicatorTheme: progressIndicatorTheme,
  popupMenuTheme: popupMenuThemeData,
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Colors.white, primary: Palette.primary)
      .copyWith(surface: Palette.bgScreen, background: Palette.bgScreen),
);
final darkTheme = themeData.copyWith(
  brightness: Brightness.dark
);
var progressIndicatorTheme = const ProgressIndicatorThemeData(
  color: Palette.primary,
);

const popupMenuThemeData = PopupMenuThemeData(
  surfaceTintColor: Colors.transparent,
);

final bottomNavigationBarThemeData = NavigationBarThemeData(
  backgroundColor: Palette.white,
  indicatorColor: Palette.white,
  surfaceTintColor: Colors.transparent,
  iconTheme: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return iconThemeData.copyWith(color: Palette.primary);
    }
    return iconThemeData.copyWith(color: Palette.text);
  }),
  labelTextStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return semiBold14.copyWith(color: Palette.primary);
    }
    return semiBold14;
  }),
);

const bottomSheetTheme = BottomSheetThemeData(
  surfaceTintColor: Colors.transparent,
);

OutlineInputBorder inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: Palette.inputBorder, width: 1.w),
);

final inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
  border: inputBorder,
  enabledBorder: inputBorder,
  focusedBorder: inputBorder.copyWith(
    borderSide: BorderSide(color: Palette.titleText, width: 1.w),
  ),
  filled: true,
  fillColor: Colors.white,
  errorStyle: semiBold10.copyWith(color: Palette.errorText),
  hintStyle: semiBold14,
  labelStyle: semiBold14,
  prefixIconColor: Palette.text,
  suffixIconColor: Palette.text,
  disabledBorder: inputBorder.copyWith(
    borderSide: const BorderSide(color: Palette.disable),
  ),
  errorBorder: inputBorder.copyWith(
    borderSide: const BorderSide(color: Palette.errorText),
  ),
  focusedErrorBorder: inputBorder.copyWith(
    borderSide: const BorderSide(color: Palette.errorText),
  ),
);

final drawerThemeData = const DrawerThemeData(backgroundColor: Palette.primary);
final outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    elevation: WidgetStateProperty.all(0),
    minimumSize: WidgetStateProperty.all(const Size.fromHeight(42)),
    padding: WidgetStateProperty.all(EdgeInsets.zero),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    side: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return const BorderSide(color: Palette.disable, width: 1);
      }
      return const BorderSide(color: Palette.primary, width: 1);
    }),
    backgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Palette.disable;
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Palette.textButtonDisable;
      }
      return Palette.primary;
    }),
    textStyle: WidgetStateProperty.all(regular14),
  ),
);

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    minimumSize: WidgetStateProperty.all(Size.fromHeight(42.w)),
    padding: WidgetStateProperty.all(EdgeInsets.zero),
    backgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Palette.disableButton;
      }
      return Palette.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Palette.white;
      }
      return Palette.white;
    }),
    textStyle: WidgetStateProperty.all(regular14),
  ),
);

final textButtonThemeData = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: Palette.primary,
    textStyle: regular14,
  ),
);

final timePickerThemeData = TimePickerThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  dialHandColor: Palette.primary,
  dialTextColor: WidgetStateColor.resolveWith(
    (states) =>
        states.contains(WidgetState.selected) ? Palette.white : Palette.primary,
  ),
  dialBackgroundColor: Palette.bgScreen,
  entryModeIconColor: Palette.text,
  hourMinuteColor: WidgetStateColor.resolveWith(
    (states) =>
        states.contains(WidgetState.selected)
            ? Palette.bgScreen
            : Palette.white,
  ),
  hourMinuteTextColor: Palette.primary,
  dayPeriodColor: WidgetStateColor.resolveWith(
    (states) =>
        states.contains(WidgetState.selected)
            ? Palette.bgScreen
            : Palette.white,
  ),
  dayPeriodTextColor: Palette.primary,
  hourMinuteShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
  helpTextStyle: semiBold14,
);

const datePickerThemeData = DatePickerThemeData(
  surfaceTintColor: Colors.transparent,
);

RadioThemeData radioThemeData = RadioThemeData(
  fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.disabled)) {
      return Palette.white;
    }
    return Palette.primary;
  }),
  overlayColor: WidgetStateProperty.all(Palette.text),
);

final switchThemeData = SwitchThemeData(
  thumbColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return Palette.primary;
    }
    return Palette.text;
  }),
  trackColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return Palette.primary.withOpacity(0.2);
    }
    return Palette.disable;
  }),
);

const listTileThemeData = ListTileThemeData(
  iconColor: Palette.text,
  textColor: Palette.text,
);

final checkboxTheme = CheckboxThemeData(
  checkColor: WidgetStateProperty.all(Palette.primary),
  fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.disabled)) {
      return Palette.white;
    }
    return Palette.white;
  }),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
    side: BorderSide(color: Palette.primary, width: 1.w),
  ),
  overlayColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.disabled)) {
      return Palette.primary;
    }
    return Palette.primary;
  }),
  side: BorderSide(color: Palette.primary, width: 1.w),
);

final dialogTheme = DialogTheme(
  backgroundColor: Palette.bgScreen,
  surfaceTintColor: Colors.transparent,
  titleTextStyle: semiBold10.copyWith(fontSize: 20.w),
  contentTextStyle: regular16,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
);
const buttonThemeData = ButtonThemeData(
  disabledColor: Palette.disable,
  buttonColor: Palette.primaryDark,
  textTheme: ButtonTextTheme.primary,
);

AppBarTheme appBarTheme = AppBarTheme(
  iconTheme: iconAppBarThemeData.copyWith(color: Palette.white),
  elevation: 0.5,
  backgroundColor: Palette.primary,
  surfaceTintColor: Colors.transparent,
  systemOverlayStyle: SystemUiOverlayStyle.light,
  actionsIconTheme: iconThemeData.copyWith(color: Colors.white),
  titleTextStyle: semiBold16.copyWith(color: Palette.white),
  centerTitle: true,
);

const iconThemeData = IconThemeData(color: Palette.text);
const iconAppBarThemeData = IconThemeData(color: Palette.text);

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 57.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  displayMedium: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 45.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  displaySmall: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 36.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  headlineLarge: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 32.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  headlineMedium: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 28.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  headlineSmall: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 24.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  titleLarge: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 20.w,
    fontWeight: FontWeight.w600,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  titleMedium: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 16.w,
    fontWeight: FontWeight.w600,
    color: Palette.titleText,
    letterSpacing: -0.5,
  ),
  titleSmall: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 14.w,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  bodyLarge: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 16.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  bodyMedium: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 14.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  bodySmall: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 12.w,
    fontWeight: FontWeight.w400,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  labelLarge: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 14.w,
    fontWeight: FontWeight.w600,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  labelMedium: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 12.w,
    fontWeight: FontWeight.w600,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
  labelSmall: TextStyle(
    fontFamily: Constant.avertaCY,
    fontSize: 10.w,
    fontWeight: FontWeight.w600,
    color: Palette.text,
    letterSpacing: -0.5,
  ),
);

final regular10 = TextStyle(
  fontFamily: Constant.avertaCY,
  fontSize: 10.w,
  color: Palette.text,
  letterSpacing: -0.5,
);

final regular11 = regular10.copyWith(fontSize: 11.w);
final regular12 = regular10.copyWith(fontSize: 12.w);
final regular13 = regular10.copyWith(fontSize: 13.w);
final regular14 = regular10.copyWith(fontSize: 14.w);
final regular16 = regular10.copyWith(fontSize: 16.w);
final regular18 = regular10.copyWith(fontSize: 18.w);

final light10 = regular10.copyWith(fontWeight: FontWeight.w300);
final light11 = light10.copyWith(fontSize: 11.w);
final light12 = light10.copyWith(fontSize: 12.w);
final light13 = light10.copyWith(fontSize: 13.w);
final light14 = light10.copyWith(fontSize: 14.w);
final light16 = light10.copyWith(fontSize: 16.w);
final light18 = light10.copyWith(fontSize: 18.w);

final semiBold10 = regular10.copyWith(fontWeight: FontWeight.w600);
final semiBold11 = semiBold10.copyWith(fontSize: 11.w);
final semiBold12 = semiBold10.copyWith(fontSize: 12.w);
final semiBold13 = semiBold10.copyWith(fontSize: 13.w);
final semiBold14 = semiBold10.copyWith(fontSize: 14.w);
final semiBold16 = semiBold10.copyWith(fontSize: 16.w);
final semiBold18 = semiBold10.copyWith(fontSize: 18.w);

final bold10 = regular10.copyWith(fontWeight: FontWeight.w700);
final bold11 = bold10.copyWith(fontSize: 11.w);
final bold12 = bold10.copyWith(fontSize: 12.w);
final bold13 = bold10.copyWith(fontSize: 13.w);
final bold14 = bold10.copyWith(fontSize: 14.w);
final bold16 = bold10.copyWith(fontSize: 16.w);
final bold18 = bold10.copyWith(fontSize: 18.w);
