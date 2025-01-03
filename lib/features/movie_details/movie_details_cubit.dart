import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Data/Models/categories.dart';
import 'package:movies_app/Data/web_services/categories_web_services.dart';

import '../../Data/Models/movie.dart';
import '../../Data/web_services/similar_movies_web_services.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  Movie? currentMovie;
  bool loading=true;
  List<Categories>categoriesOfMovie=[];
  List<Movie>?similarMovies;
  MovieDetailsCubit({required this.currentMovie}) : super(MovieDetailsInitial()){
    getSimilarMovies();
  }

  void getSimilarMovies()async{
    loading=true;
    emit(SimilarMoviesLoading());
    similarMovies=[];
    print(currentMovie!.id);
    similarMovies=await SimilarMoviesWebServices.getSimilarMovies(currentMovie!.id.toString());
    List<Categories>temp=[];
    temp=await CategoriesWebServices.getCategories();
    for(int i=0;i<currentMovie!.genreIds!.length;i++){
      for(int j=0;j<temp.length;j++){
        if(currentMovie!.genreIds![i]==temp[j].id){
          categoriesOfMovie.add(temp[j]);
          break;
        }
      }
    }
    loading=false;
    emit(SimilarMoviesSuccess());
  }
  void addToWatchList(Movie movie){
    if(movie.watchList){
      movie.watchList=false;}
    else{
      movie.watchList=true;}
    emit(SimilarMoviesSuccess());
  }

}
