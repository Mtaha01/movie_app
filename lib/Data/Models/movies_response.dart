import 'package:movies_app/Data/Models/movie.dart';

class MoviesResponse{
  late int? page;
  late List<Movie>? movies=[];
  late int? totalPages;
  late int? totalResults;
  MoviesResponse.fromJson(dynamic json){
  page=json['page'];
  if(json["results"]!=null){
    movies=[];
    json["results"].forEach((v)=>movies!.add(Movie.fromJson(v)));
  }
  totalPages=json['total_pages'];
  totalResults=json['total_results'];

  }
}