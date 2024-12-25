import 'package:movies_app/Data/Models/categories.dart';

class CategoriesResponse{
  late List<Categories>? categories;

  CategoriesResponse.fromJson(dynamic json){
    if(json["genres"]!=null){
      categories=[];
      json["genres"].forEach((v)=>categories!.add(Categories.fromJson(v)));
    }
  }
}