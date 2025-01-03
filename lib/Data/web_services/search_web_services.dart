import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/movie.dart';
import '../Models/movies_response.dart';

class SearchWebServices{
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = '07b500860b4ac36647b70e62a67f09e0';
  static  String _movieSearch = "/3/search/movie";

  static Future<List<Movie>?>getSearchResults(String? name)async{
    Uri url = Uri.https(_baseUrl,_movieSearch,{'query':name,'api_key':_apiKey});
    http.Response serverResponse = await http.get(url); // make a network Request
    Map<String, dynamic> json = jsonDecode(serverResponse.body); // convert from string to json
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    await Future.wait(moviesResponse.movies!.map((movieX)async{
      await movieX.setWatchList(movieX.id!);
    }));
    return moviesResponse.movies!;
  }

}