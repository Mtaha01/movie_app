import 'package:flutter/material.dart';
import 'package:movies_app/Data/Models/categories.dart';
import 'package:movies_app/Data/Models/movie.dart';
import 'package:movies_app/features/browse_screen/category_filtered/category_filtered.dart';
import 'package:movies_app/features/movie_details/movie_details.dart';

import '../features/splash_screen/splash.dart';
import '../features/tabs/tabs.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String filtered = '/filtered';
  static const String tabs = '/tabs';
  static const String moviesDetails = '/moviesDetails';

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
      case filtered:
        final args = settings.arguments as Categories;
        return MaterialPageRoute(
          builder: (context) => CategoryFiltered(category:args),
        );
      case moviesDetails:
        final args = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (context) => MovieDetails(movie: args),
        );
    }
  }
}