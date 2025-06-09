import 'package:flutter/material.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void close() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.pop();
    }
  }

  static void go(Widget page) {
    navigatorKey.currentState?.push(_createRoute(page));
  }

  static void open(Widget page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      _createRoute(page),
      (Route<dynamic> route) => false,
    );
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
          // reverseCurve: Curves.easeInExpo,
        );
        return ScaleTransition(
          alignment: Alignment.center,
          scale: Tween<double>(begin: 0.950, end: 1).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
