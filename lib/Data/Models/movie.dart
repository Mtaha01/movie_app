class Movie{

  late bool? forAdult ;
  late String? backgroundImagePath;
  late List<dynamic> genreIds;
  late int? id;
  late String? originalLanguage;
  late String? originalTitle;
  late String? overviewText;
  late double? popularity;
  late String? posterImagePath;
  late String? releaseDate;
  late String? title;
  late bool? hasVideo;
  late double? voteAverage;
  late int? voteCount;

  Movie.fromJson(dynamic json){
    forAdult=json["adult"];
    backgroundImagePath=json["backdrop_path"];
    genreIds=json['genre_ids'];
    id=json["id"];
    originalLanguage=json["original_language"];
    originalTitle=json["original_title"];
    overviewText=json["overview"];
    popularity=json["popularity"];
    posterImagePath=json["poster_path"];
    releaseDate=json["release_date"];
    title=json["title"];
    hasVideo=json["video"];
    voteAverage=json["vote_average"];
    voteCount=json["vote_count"];
  }
}