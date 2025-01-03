import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/movie.dart';

class WatchListWebServices {
  static Future<List<Movie>> getWatchListFromFireStore() async {
    CollectionReference watchListCollection =
      FirebaseFirestore.instance.collection("watch_list");
    QuerySnapshot collectionSnapShot = await watchListCollection.get();
    List<QueryDocumentSnapshot> documentsSnapShot = collectionSnapShot.docs;
    List<Movie> watchListMovies = documentsSnapShot.map(
      (docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        Movie movie = Movie.fromFireStore(json);
        return movie;
      },
    ).toList();

    return watchListMovies;
  }

  static Future<void> addToWatchListToFireStore(Movie movie) async{
    CollectionReference watchListCollection =
        FirebaseFirestore.instance.collection("watch_list");
    DocumentReference documentReference = watchListCollection.doc(movie.id.toString());
    await documentReference.set(movie.toFireStore());
  }

  static Future<void> removeFromWatchListInFireStore(Movie movie)async {
    CollectionReference watchListCollection = FirebaseFirestore.instance.collection("watch_list");
    DocumentReference documentReference = watchListCollection.doc(movie.id.toString());
    await documentReference.delete();
  }
}
