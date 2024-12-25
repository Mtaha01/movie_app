import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/Data/Models/categories.dart';
import 'package:movies_app/Data/Models/categories_response.dart';

class CategoriesWebServices{
  static const String _baseUrl = 'api.themoviedb.org';
  static const String _apiKey = '07b500860b4ac36647b70e62a67f09e0';
  static const String _categories = '/3/genre/movie/list';

  static Future<List<Categories>>getCategories()async{
    Uri url = Uri.https(_baseUrl,_categories,{'api_key':_apiKey});
    http.Response serverResponse = await http.get(url); // make a network Request
    Map<String, dynamic> json = jsonDecode(serverResponse.body); // convert from string to json
    CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
    print(categoriesResponse.categories!.length);
    return categoriesResponse.categories!;
  }

}