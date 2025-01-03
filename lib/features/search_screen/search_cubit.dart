import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Data/web_services/search_web_services.dart';

import '../../Data/Models/movie.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late List<Movie>? results=[];
  String baseImageUrl="https://image.tmdb.org/t/p/w500";
  bool searchLoading=false;
  TextEditingController searchName = TextEditingController();
  SearchCubit() : super(SearchInitial());

  void getResults(String? name)async{
    searchLoading=true;
    emit(SearchLoading());
    results=[];
    results=await SearchWebServices.getSearchResults(name);
    searchLoading=false;
    emit(SearchSuccess());
  }
}
