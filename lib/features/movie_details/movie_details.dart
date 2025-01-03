import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/app_styles.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/core/image_network_widget.dart';
import 'package:movies_app/core/loading_circular.dart';
import 'package:movies_app/features/movie_details/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/similarMoviesWidget.dart';
import 'package:movies_app/features/search_screen/search_results_widget.dart';

import '../../Data/Models/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(currentMovie: movie),
      child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<MovieDetailsCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                movie.title!,
                style: AppStyles.largeText,
              ),
              iconTheme: const IconThemeData(color: ColorsManager.white),
            ),
            body: cubit.loading? LoadingCircular():Column(
              children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                      color: ColorsManager.darkGrey,
                      width: double.infinity,
                      height: 212.h,
                      child: ImageNetworkWidget(
                        imagePath: movie.backgroundImagePath,
                      )),
                  const Center(
                    child: Icon(
                      Icons.play_circle,
                      color: ColorsManager.white,
                      size: 60,
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.title!,
                    style: AppStyles.mediumTitles,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    movie.releaseDate!,
                    style: AppStyles.smallText,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 4.0),
                      child: Stack(
                        children: [
                          Container(
                            color: ColorsManager.darkGrey,
                            child: ImageNetworkWidget(
                              imagePath: movie.posterImagePath,
                            ),
                            width: 129.w,
                            height: 199.h,
                          ),
                          movie.watchList?
                          Container(
                            width: 27.w,
                            height: 36.h,
                            color: ColorsManager.yellow,
                            child: Center(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  cubit.addToWatchList(movie);
                                },
                                icon: Icon(
                                  Icons.done,
                                  color: ColorsManager.white.withOpacity(.6),
                                ),
                              ),
                            ),
                          ):
                          Container(
                            width: 27.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: ColorsManager.lightGrey.withOpacity(.5),
                              //borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  cubit.addToWatchList(movie);
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: ColorsManager.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 25.h,
                              //width: 195.w,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 65.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(
                                          color: ColorsManager.lightGrey),
                                    ),
                                    child: Text(
                                      cubit.categoriesOfMovie[index].name!,
                                      style: AppStyles.mediumTitles,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                                itemCount: cubit.categoriesOfMovie.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie.overviewText!,
                              style: AppStyles.mediumTitles,
                              maxLines: 4,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star, color: ColorsManager.yellow,),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(movie.voteAverage.toString(),
                                  style: AppStyles.mediumTitles,),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                if(cubit.similarMovies!.length>0)
                SimilarMoviesWidget(cubit: cubit),
              ],
            ),
          );
        },
      ),
    );
  }
}
