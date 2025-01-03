import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/app_styles.dart';
import 'package:movies_app/core/image_network_widget.dart';
import 'package:movies_app/features/movie_details/movie_details_cubit.dart';

import '../../core/colors_manager.dart';
import '../../core/routes_manager.dart';

class SimilarMoviesWidget extends StatelessWidget {
  final MovieDetailsCubit cubit;
  SimilarMoviesWidget({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 200,
        color: ColorsManager.darkGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5.0),
              child: Text(
                "More Like This",
                style: AppStyles.mediumTitles,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cubit.similarMovies!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.moviesDetails,
                          arguments: cubit.similarMovies![index]);
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 97.w,
                              height: 128.h,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: ColorsManager.lightGrey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ImageNetworkWidget(
                                  imagePath:
                                      cubit.similarMovies![index].posterImagePath),
                            ),
                            cubit.similarMovies![index].watchList?
                            Container(
                              width: 27.w,
                              height: 36.h,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: ColorsManager.yellow,
                              child: Center(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    cubit.addToWatchList(cubit.similarMovies![index]);
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
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: ColorsManager.lightGrey.withOpacity(.5),
                                //borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    cubit.addToWatchList(cubit.similarMovies![index]);
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
                        Container(
                          height: 56.h,
                          width: 97.w,
                          decoration: BoxDecoration(
                            color: ColorsManager.detailsBackgroundColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: ColorsManager.yellow,
                                      size: 10,
                                    ),
                                    Text(
                                      cubit.similarMovies![index].voteAverage.toString(),
                                      style: AppStyles.smallText,
                                    ),
                                  ],
                                ),
                                Text(
                                  cubit.similarMovies![index].title!,
                                  style: AppStyles.smallText,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
