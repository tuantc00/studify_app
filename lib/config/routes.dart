import 'package:demo2/core/presentation/pages/home/home_page.dart';
import 'package:demo2/core/presentation/pages/sign_in/sign_in_page.dart';
import 'package:demo2/core/presentation/pages/sign_up/sign_up_page.dart';
import 'package:demo2/core/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:demo2/main.dart';

class AppRoute {
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    MyApp.log.i('Navigating to route: ${settings.name}');
    switch (settings.name) {
      case signIn:
        MyApp.log.d('Route resolved: SignInPage');
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case signUp:
        MyApp.log.d('Route resolved: SignUpPage');
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case home:
        MyApp.log.d('Route resolved: HomePage');
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        MyApp.log.w('No route defined for ${settings.name}');
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                appBar: BaseAppBar(label: '', hasBackButton: true),
                body: Center(child: Text('!!!!!!!!')),
              ),
          settings: settings,
        );
    }
  }

  static void replaceWith(BuildContext context, String routeName) {
    MyApp.log.i('Replacing current route with: $routeName');
    Navigator.pushReplacementNamed(context, routeName);
  }
}

class NavigatorKey {
  static final key = GlobalKey<NavigatorState>();
}

class NavController {
  static Future<T?>? pushNamed<T extends Object?>(
      String routeName, {
        Map<String, dynamic>? arguments,
      }) {
    return NavigatorKey.key.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static Future<T?>? pushReplacementNamed<T extends Object?>(
      String routeName, {
        Map<String, dynamic>? arguments,
      }) {
    return NavigatorKey.key.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<T?>? popAndPushNamed<T extends Object?>(
      String routeName, {
        Map<String, dynamic>? arguments,
      }) {
    return NavigatorKey.key.currentState?.popAndPushNamed(routeName, arguments: arguments);
  }

  static pushNamedAndRemoveUntil(String newRouteName,
      {String? heldRouteName, Map<String, dynamic>? arguments}) {
    NavigatorKey.key.currentState?.pushNamedAndRemoveUntil(
      newRouteName,
      heldRouteName != null ? ModalRoute.withName(heldRouteName) : (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static void pop([dynamic result]) {
    NavigatorKey.key.currentState?.pop(result);
  }

  static void maybePop([dynamic result]) {
    NavigatorKey.key.currentState?.maybePop(result);
  }

  // static void popUntil(String routeName, {dynamic result}) {
  //   return popUntilUnIdentifiedRoute([routeName], result: result);
  // }

  /// if passing data ([result] != null), type of arguments in the destination route must be defined
  /// as [Map<String, dynamic>] in [settings] of [onGenerateRoute]
  // static void popUntilUnIdentifiedRoute(List<String> routeNames, {dynamic result}) {
  //   try {
  //     NavigatorKey.key.currentState?.popUntil((route) {
  //       bool isPopped = false;
  //       for (var routeName in routeNames) {
  //         if (route.settings.name == routeName) {
  //           // log('NavController|popUtilUnIdentifiedRoute: $routeName is true');
  //           if (result != null) {
  //             (route.settings.arguments as Map)[Constant.results] = result;
  //           }
  //           isPopped = true;
  //           break;
  //         } else {
  //           // log('NavController|popUtilUnIdentifiedRoute: ${route.settings.name} is not $routeName');
  //           isPopped = false;
  //         }
  //       }
  //       // log('NavController|popUtilUnIdentifiedRoute: route = ${route.settings.name} | isPopped = $isPopped');
  //       return isPopped;
  //     });
  //   } catch (e) {
  //     log('NavController|popUntilUnIdentifiedRoute: error = $e');
  //   }
  // }
  //
  // /// get result from popUtilUnIdentifiedRoute
  // static dynamic getResultFromPopUtil(BuildContext context) {
  //   final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  //
  //   final results = arguments[Constant.results];
  //   arguments[Constant.results] = null;
  //   return results;
  // }
}
