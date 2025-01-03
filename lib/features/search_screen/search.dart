import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/loading_circular.dart';
import 'package:movies_app/features/search_screen/search_cubit.dart';
import 'package:movies_app/features/search_screen/search_results_widget.dart';
import 'package:movies_app/features/search_screen/text_field_search.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var searchCubit = context.read<SearchCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFieldSearch(sCubit:searchCubit),
                ),
              ),
              Expanded(
                flex: 10,
                child: searchCubit.searchLoading
                    ? LoadingCircular()
                    : searchCubit.results!.isEmpty?const Center(
                        child: Icon(
                          Icons.local_movies_sharp,
                          color: ColorsManager.white,
                          size: 100,
                        ),
                      ):SearchResultsWidget(results: searchCubit.results),
              )
            ],
          );
        },
      ),
    );
  }
}
