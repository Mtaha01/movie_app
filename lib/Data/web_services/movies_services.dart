import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/Data/Models/movie.dart';
import 'package:movies_app/Data/Models/movies_response.dart';
class MoviesWebServices{
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = '07b500860b4ac36647b70e62a67f09e0';
  static const String popularMovies = '/3/movie/popular';
  static const String newRelease = '/3/movie/upcoming';
  static const String recommended = '/3/movie/top_rated';

  static Future<List<Movie>>getPopularMovies()async{
    Uri url = Uri.https(_baseUrl,popularMovies,{'api_key':_apiKey});
    http.Response serverResponse = await http.get(url); // make a network Request
    Map<String, dynamic> json = jsonDecode(serverResponse.body); // convert from string to json
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    await Future.wait(moviesResponse.movies!.map((movieX)async{
      await movieX.setWatchList(movieX.id!);
    }));
    return moviesResponse.movies!;
  }

  static Future<List<Movie>>getNewReleasesMovies()async{
    Uri url = Uri.https(_baseUrl,newRelease,{'api_key':_apiKey});
    http.Response serverResponse = await http.get(url); // make a network Request
    Map<String, dynamic> json = jsonDecode(serverResponse.body); // convert from string to json
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    await Future.wait(moviesResponse.movies!.map((movieX)async{
      await movieX.setWatchList(movieX.id!);
    }));
    return moviesResponse.movies!;
  }

  static Future<List<Movie>>getRecommendedMovies()async{
    Uri url = Uri.https(_baseUrl,recommended,{'api_key':_apiKey});
    http.Response serverResponse = await http.get(url); // make a network Request
    Map<String, dynamic> json = jsonDecode(serverResponse.body); // convert from string to json
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    await Future.wait(moviesResponse.movies!.map((movieX)async{
      await movieX.setWatchList(movieX.id!);
    }));
    return moviesResponse.movies!;
  }

}