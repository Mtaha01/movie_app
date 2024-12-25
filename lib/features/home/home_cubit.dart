import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Data/Models/movie.dart';

import '../../Data/web_services/movies_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late List<Movie>? recommendedMovies;
  late List<Movie>? newReleasedMovies;
  late List<Movie>? popularMovies;
  String baseImageUrl="https://image.tmdb.org/t/p/w500";
  bool recommendedMoviesIsLoading = true;
  bool newMoviesIsLoading = true;
  bool popularMoviesIsLoading = true;

  HomeCubit() : super(HomeInitial()) {
    getAllMovies();
  }

  void getAllMovies() async {
    emit(PopularMoviesLoading());
    popularMovies =
        await MoviesWebServices.getPopularMovies();
    newReleasedMovies =
        await MoviesWebServices.getNewReleasesMovies();
    recommendedMovies =
        await MoviesWebServices.getRecommendedMovies();
    recommendedMoviesIsLoading = false;
    newMoviesIsLoading = false;
    popularMoviesIsLoading = false;

    emit(PopularMoviesDone());
  }
}
