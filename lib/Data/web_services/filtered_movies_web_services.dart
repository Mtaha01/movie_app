import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:movies_app/Data/Models/movie.dart';

import '../Models/movies_response.dart';

class FilteredMoviesWebServices{
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = '07b500860b4ac36647b70e62a67f09e0';
  static const String _categories = '3/discover/movie';

  static Future<List<Movie>>getCategories(int categoryID)async{
    Uri url = Uri.https(_baseUrl,_categories,{'with_genres':categoryID.toString(),'api_key':_apiKey});
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    MoviesResponse filteredResponse = MoviesResponse.fromJson(json);
    await Future.wait(filteredResponse.movies!.map((movieX)async{
      await movieX.setWatchList(movieX.id!);
    }));
    return filteredResponse.movies!;
  }

}