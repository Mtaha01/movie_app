import 'package:flutter/material.dart';

import '../features/home/home.dart';
import '../features/splash_screen/splash.dart';
import '../features/tabs/tabs.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String tabs = '/tabs';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case tabs:
        return MaterialPageRoute(
          builder: (context) => const Tabs(),
        );
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
    }
  }
}