import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/app_styles.dart';
import 'package:movies_app/core/image_network_widget.dart';

import '../../core/colors_manager.dart';
import '../../core/routes_manager.dart';
import 'home_cubit.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  final HomeCubit cubit;
  RecommendedMoviesWidget({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 200,
        color: ColorsManager.darkGrey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5.0),
            child: Text(
              "Recommended",
              style: AppStyles.mediumTitles,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.recommendedMovies!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManager.moviesDetails,
                        arguments: cubit.recommendedMovies![index]);
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            width: 97.w,
                            height: 128.h,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: ImageNetworkWidget(
                                imagePath: cubit
                                    .recommendedMovies![index].posterImagePath),
                          ),
                          cubit.recommendedMovies![index].watchList?
                          Container(
                            width: 27.w,
                            height: 36.h,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: ColorsManager.yellow,
                            child: Center(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  cubit.addToWatchList(cubit.recommendedMovies![index]);
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
                                  cubit.addToWatchList(cubit.recommendedMovies![index]);
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
                                    "7.7",
                                    style: AppStyles.smallText,
                                  ),
                                ],
                              ),
                              Text(
                                cubit.recommendedMovies![index].title!,
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
        ]),
      ),
    );
  }
}
