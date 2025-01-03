import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/Data/Models/movie.dart';
import 'package:movies_app/Data/Models/movies_response.dart';
class SimilarMoviesWebServices{
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = '07b500860b4ac36647b70e62a67f09e0';
  static const String similar = '/3/movie/';

  static Future<List<Movie>>getSimilarMovies(String movieID)async{
    Uri url = Uri.https(_baseUrl,similar+movieID+"/similar",{'api_key':_apiKey});
    http.Response serverResponse = await http.get(url); // make a network Request
    Map<String, dynamic> json = jsonDecode(serverResponse.body); // convert from string to json
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    await Future.wait(moviesResponse.movies!.map((movieX)async{
      await movieX.setWatchList(movieX.id!);
    }));
    print (moviesResponse.movies!.length);
    return moviesResponse.movies!;
  }
}