import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/watch_list_cubit.dart';
import 'package:movies_app/features/watch_list/watch_list_movies_widget.dart';import '../../core/colors_manager.dart';


import '../../core/loading_circular.dart';
class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListCubit(),
      child: BlocConsumer<WatchListCubit, WatchListState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var watchListCubit = context.read<WatchListCubit>();
          return watchListCubit.loading
              ? Center(child: LoadingCircular())
              : watchListCubit.watchListMovies!.length==0 ? const Center(
            child: Icon(
              Icons.local_movies_sharp,
              color: ColorsManager.white,
              size: 100,
            ),
          ) : WatchListMoviesWidget(cubit: watchListCubit);
        },
      ),
    );
  }
}
