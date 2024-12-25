import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Data/Models/categories.dart';
import 'package:movies_app/Data/web_services/categories_web_services.dart';
import 'package:movies_app/Data/web_services/movies_services.dart';

part 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  late List<Categories> categories;
  bool categoriesAreLoading=true;
  BrowseCubit() : super(BrowseInitial()){
    getCategories();
  }
  void getCategories()async{
    emit(GetCategoriesLoading());
    categories=await CategoriesWebServices.getCategories();
    if(categories.isEmpty){
      emit(GetCategoriesError());
    }else{
      categoriesAreLoading=false;
      emit(GetCategoriesSuccess());
    }
  }
}
