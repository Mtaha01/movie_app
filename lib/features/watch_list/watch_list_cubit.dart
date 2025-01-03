import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Data/web_services/watch_list_web_services.dart';

import '../../Data/Models/movie.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  late List<Movie>? watchListMovies=[];
  bool loading=true;
  WatchListCubit() : super(WatchListInitial()){
   getWatchList();
  }

  void getWatchList()async{
    emit(GetWatchListLoading());
    watchListMovies=await WatchListWebServices.getWatchListFromFireStore();
    loading=false;
    emit(GetWatchListSuccess());
  }

  void removeFromWatchList(Movie movie,int index)async{
    emit(GetWatchListLoading());
    await WatchListWebServices.removeFromWatchListInFireStore(movie);
    movie.watchList=false;
    watchListMovies!.removeAt(index);
    emit(GetWatchListSuccess());
  }
}
