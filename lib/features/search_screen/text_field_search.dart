import 'package:flutter/material.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/features/search_screen/search_cubit.dart';

import '../../core/app_styles.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({required this.sCubit,super.key});
  final SearchCubit sCubit;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      style: AppStyles.mediumTitles,
      cursorColor: ColorsManager.white,
      controller: sCubit.searchName,
      onChanged: (value) {
        sCubit.searchName.text = value;
        sCubit.getResults(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.lightGrey.withOpacity(.6),
        hintText: "Search",
        label: Text(sCubit.searchName.text,style: AppStyles.mediumTitles,),
        prefixIcon:  IconButton(
          onPressed:(){

          } ,
          icon: Icon(Icons.search),
          color: ColorsManager.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide:const BorderSide(
            color: ColorsManager.offWhite,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey[600]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
      ),
    );
  }
}
