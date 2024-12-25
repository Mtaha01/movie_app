import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/browse_screen/browse.dart';
import 'package:movies_app/features/home/home.dart';
import 'package:movies_app/features/search_screen/search.dart';
import 'package:movies_app/features/wish_list_screen/wish_list.dart';

part 'tabs_state.dart';
class TabsCubit extends Cubit<TabsState> {
   int selectedItem=0;

   List<Widget>tabs=[Home(),Search(),Browse(),WishList()];

  TabsCubit() : super(TabsInitial());

  void tabClicked(int idx){
    selectedItem=idx;
    emit(TabClickedState());
  }
}
