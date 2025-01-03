import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/app_styles.dart';
import 'package:movies_app/core/image_network_widget.dart';
import 'package:movies_app/core/routes_manager.dart';
import 'package:movies_app/features/movie_details/movie_details.dart';

import '../../core/colors_manager.dart';
import 'home_cubit.dart';

class NewMoviesWidget extends StatelessWidget {
  final HomeCubit cubit;
  NewMoviesWidget({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, top: 10),
      child: Container(
        width: double.infinity,
        height: 150,
        color: ColorsManager.darkGrey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Text(
              "New Released",
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
                        arguments: cubit.newReleasedMovies![index]);
                  },
                  child: Stack(children: [
                    Container(
                      width: 97.w,
                      height: 128.h,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ImageNetworkWidget(
                          imagePath:
                              cubit.newReleasedMovies![index].posterImagePath),
                    ),
                    cubit.newReleasedMovies![index].watchList?
                    Container(
                      width: 27.w,
                      height: 36.h,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: ColorsManager.yellow,
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            cubit.addToWatchList(cubit.newReleasedMovies![index]);
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
                            cubit.addToWatchList(cubit.newReleasedMovies![index]);
                          },
                          icon: Icon(
                            Icons.add,
                            color: ColorsManager.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
