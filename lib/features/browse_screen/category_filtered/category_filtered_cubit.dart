import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Data/Models/categories.dart';
import 'package:movies_app/Data/Models/movie.dart';
import 'package:movies_app/Data/web_services/filtered_movies_web_services.dart';

part 'category_filtered_state.dart';

class CategoryFilteredCubit extends Cubit<CategoryFilteredState> {
  Categories category;
  bool loading =true;
  List<Movie>results=[];
  CategoryFilteredCubit({required this.category}) : super(CategoryFilteredInitial())  {
    getResults();
  }

  void getResults()async{
    loading=true;
    emit(CategoryFilteredLoading());
    results=[];
    results=await FilteredMoviesWebServices.getCategories(category.id!);
    loading=false;
    emit(CategoryFilteredSuccess());
  }
}
