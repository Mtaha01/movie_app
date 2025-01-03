import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/browse_screen/category_filtered/category_filtered_cubit.dart';

import '../../../Data/Models/categories.dart';
import '../../../core/colors_manager.dart';
import '../../../core/loading_circular.dart';
import '../../search_screen/search_results_widget.dart';

class CategoryFiltered extends StatelessWidget {
  const CategoryFiltered({required this.category, super.key});

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryFilteredCubit(category: category),
      child: BlocConsumer<CategoryFilteredCubit, CategoryFilteredState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var filteredCubit = context.read<CategoryFilteredCubit>();
          return Expanded(
            flex: 10,
            child: filteredCubit.loading
                ? LoadingCircular()
                : filteredCubit.results.isEmpty ? const Center(
              child: Icon(
                Icons.local_movies_sharp,
                color: ColorsManager.white,
                size: 100,
              ),
            ) : SearchResultsWidget(results: filteredCubit.results),
          );
        },
      ),
    );
  }
}
