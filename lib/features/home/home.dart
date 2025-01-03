import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/loading_circular.dart';
import 'package:movies_app/features/home/home_cubit.dart';
import 'package:movies_app/features/home/popular_movies_widget.dart';
import 'package:movies_app/features/home/new_movies_widget.dart';
import 'package:movies_app/features/home/recommended_movies_widget.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              cubit.popularMoviesIsLoading
                  ? const LoadingCircular()
                  : PopularMoviesWidget(cubit: cubit),
              cubit.newMoviesIsLoading
                  ?  const LoadingCircular():
              NewMoviesWidget(cubit: cubit,),
              cubit.recommendedMoviesIsLoading
                  ?  const LoadingCircular():
             RecommendedMoviesWidget(cubit: cubit,),
            ],
          );
        },
      ),
    );
  }
}

