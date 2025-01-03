import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_styles.dart';
import 'package:movies_app/features/browse_screen/browse_cubit.dart';
import 'package:movies_app/features/browse_screen/category_widget.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseCubit(),
      child: BlocConsumer<BrowseCubit, BrowseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var categoryCubit=context.read<BrowseCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Browse Category",
                  style: AppStyles.mediumTitles,
                ),
              ),
              Expanded(
                child:categoryCubit.categoriesAreLoading? const Icon(Icons.downloading): GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: categoryCubit.categories.length,
                  itemBuilder: (context, index) => CategoryWidget(category: categoryCubit.categories[index]),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
