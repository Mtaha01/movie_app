import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  late bool? forAdult;
  late String? backgroundImagePath;
  late List<dynamic>? genreIds;
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
  bool watchList = false;
  Movie.fromJson(dynamic json){
    forAdult = json["adult"];
    backgroundImagePath = json["backdrop_path"];
    genreIds = json['genre_ids'];
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overviewText = json["overview"];
    popularity = json["popularity"];
    posterImagePath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    hasVideo = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
  }
  Future <void> setWatchList(int id)async{
    CollectionReference watchListCollection =
    FirebaseFirestore.instance.collection("watch_list");
    DocumentReference documentReference = watchListCollection.doc(id.toString());
    DocumentSnapshot docSnapshot = await documentReference.get();
    if(docSnapshot.exists){
     watchList=true;
    }
  }
  Map<String, dynamic> toFireStore() => {
        "adult": forAdult,
        "backdrop_path": backgroundImagePath,
        'genre_ids': genreIds,
        "id": id,
        "original_language": originalLanguage,
        "overview": overviewText,
        "popularity": popularity,
        "poster_path": posterImagePath,
        "release_date": releaseDate,
        "title": title,
        "video": hasVideo,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "watch_list":watchList
      };

  Movie.fromFireStore(Map<String, dynamic> json){
    forAdult = json["adult"];
    backgroundImagePath = json["backdrop_path"];
    genreIds = json['genre_ids'];
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overviewText = json["overview"];
    popularity = json["popularity"];
    posterImagePath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    hasVideo = json["video"];
    voteAverage = json["vote_average"];
    voteCount = json["vote_count"];
    watchList = json['watch_list'];
  }

}
