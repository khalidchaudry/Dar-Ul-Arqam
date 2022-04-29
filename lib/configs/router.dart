import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return _customPageRoute(child: const SplashScreen());
    case LoginScreen.routeName:
      return _customPageRoute(child: const LoginScreen());
    case HomeScreen.routeName:
      return _customPageRoute(child: const HomeScreen());
    case AttendenceScreen.routeName:
      return _customPageRoute(child: const AttendenceScreen());

    default:
      return _platformPageRoute(
        child: UndefinedScreen(routeName: settings.name!),
      );
  }
}

/// Use platform depended page route
_platformPageRoute({
  required Widget child,
  RouteSettings? settings,
}) {
  return Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => child, settings: settings)
      : MaterialPageRoute(builder: (context) => child, settings: settings);
}

/// Create custom page route transition
_customPageRoute({
  required Widget child,
  RouteSettings? settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    transitionDuration: Duration.zero,
  );
}
