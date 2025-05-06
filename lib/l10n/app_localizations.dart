import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @hello.
  ///
  /// In vi, this message translates to:
  /// **'Xin chào'**
  String get hello;

  /// No description provided for @login.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get login;

  /// No description provided for @userName.
  ///
  /// In vi, this message translates to:
  /// **'Tên đăng nhập'**
  String get userName;

  /// No description provided for @password.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In vi, this message translates to:
  /// **'Quên mật khẩu'**
  String get forgotPassword;

  /// No description provided for @signUp.
  ///
  /// In vi, this message translates to:
  /// **'Đăng ký'**
  String get signUp;

  /// No description provided for @signUpNow.
  ///
  /// In vi, this message translates to:
  /// **'Đăng ký ngay! '**
  String get signUpNow;

  /// No description provided for @signIn.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get signIn;

  /// No description provided for @doNotHaveAccount.
  ///
  /// In vi, this message translates to:
  /// **'Bạn chưa có tài khoản?'**
  String get doNotHaveAccount;

  /// No description provided for @haveAccount.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đã có tài khoản?'**
  String get haveAccount;

  /// No description provided for @notify.
  ///
  /// In vi, this message translates to:
  /// **'Thông báo'**
  String get notify;

  /// No description provided for @close.
  ///
  /// In vi, this message translates to:
  /// **'Đóng'**
  String get close;

  /// No description provided for @signInNow.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập ngay'**
  String get signInNow;

  /// No description provided for @confirm.
  ///
  /// In vi, this message translates to:
  /// **'Xác thực'**
  String get confirm;

  /// No description provided for @home.
  ///
  /// In vi, this message translates to:
  /// **'Trang chủ'**
  String get home;

  /// No description provided for @person.
  ///
  /// In vi, this message translates to:
  /// **'Cá nhân'**
  String get person;

  /// No description provided for @avatar.
  ///
  /// In vi, this message translates to:
  /// **'Ảnh đại diện'**
  String get avatar;

  /// No description provided for @logoutConfirm.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có chắc chắn đăng xuất tài khoản không?'**
  String get logoutConfirm;

  /// No description provided for @cancel.
  ///
  /// In vi, this message translates to:
  /// **'Hủy'**
  String get cancel;

  /// No description provided for @logout.
  ///
  /// In vi, this message translates to:
  /// **'Đăng xuất'**
  String get logout;

  /// No description provided for @requiredInfor.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin bắt buộc'**
  String get requiredInfor;

  /// No description provided for @finish.
  ///
  /// In vi, this message translates to:
  /// **'Hoàn thành '**
  String get finish;

  /// No description provided for @next.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp theo'**
  String get next;

  /// No description provided for @profile.
  ///
  /// In vi, this message translates to:
  /// **'Cá nhân'**
  String get profile;

  /// No description provided for @favourite.
  ///
  /// In vi, this message translates to:
  /// **'Yêu thích'**
  String get favourite;

  /// No description provided for @leaderBoard.
  ///
  /// In vi, this message translates to:
  /// **'Bảng xếp hạng'**
  String get leaderBoard;

  /// No description provided for @congratContent.
  ///
  /// In vi, this message translates to:
  /// **'Chúc mừng bạn đã hoàn thành các câu hỏi!'**
  String get congratContent;

  /// No description provided for @yourResult.
  ///
  /// In vi, this message translates to:
  /// **'Kết quả của bạn'**
  String get yourResult;

  /// No description provided for @loginFailed.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập thất bại'**
  String get loginFailed;

  /// No description provided for @enterEmail.
  ///
  /// In vi, this message translates to:
  /// **'Nhập Email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In vi, this message translates to:
  /// **'Nhập mật khẩu'**
  String get enterPassword;

  /// No description provided for @or.
  ///
  /// In vi, this message translates to:
  /// **'Hoặc'**
  String get or;

  /// No description provided for @signInWithGoogle.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập với Google'**
  String get signInWithGoogle;

  /// No description provided for @signOutSuccess.
  ///
  /// In vi, this message translates to:
  /// **'Đăng ký thành công'**
  String get signOutSuccess;

  /// No description provided for @signOutFailed.
  ///
  /// In vi, this message translates to:
  /// **'Đăng ký thất bại'**
  String get signOutFailed;

  /// No description provided for @warning.
  ///
  /// In vi, this message translates to:
  /// **'Cảnh báo'**
  String get warning;

  /// No description provided for @continueToDo.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp tục'**
  String get continueToDo;

  /// No description provided for @exit.
  ///
  /// In vi, this message translates to:
  /// **'Thoát'**
  String get exit;

  /// No description provided for @resultWarning.
  ///
  /// In vi, this message translates to:
  /// **'Kết quả của bạn sẽ không được lưu'**
  String get resultWarning;

  /// No description provided for @email.
  ///
  /// In vi, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @english.
  ///
  /// In vi, this message translates to:
  /// **'ENG'**
  String get english;

  /// No description provided for @vietNam.
  ///
  /// In vi, this message translates to:
  /// **'VIE'**
  String get vietNam;

  /// No description provided for @language.
  ///
  /// In vi, this message translates to:
  /// **'Ngôn ngữ'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In vi, this message translates to:
  /// **'Giao diện'**
  String get theme;

  /// No description provided for @darkMode.
  ///
  /// In vi, this message translates to:
  /// **'Tối'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In vi, this message translates to:
  /// **'Sáng'**
  String get lightMode;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
