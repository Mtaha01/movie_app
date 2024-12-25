import 'package:flutter/material.dart';

import 'core/routes_manager.dart';
import 'core/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router,
      initialRoute: RoutesManager.splash,
      theme: AppTheme.light,
    );
  }
}
