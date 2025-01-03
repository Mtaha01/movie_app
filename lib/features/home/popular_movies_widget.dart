import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/app_styles.dart';
import 'package:movies_app/core/image_network_widget.dart';
import 'package:movies_app/features/home/new_movies_widget.dart';

import '../../core/colors_manager.dart';
import '../../core/routes_manager.dart';
import 'home_cubit.dart';


class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context,RoutesManager.moviesDetails,arguments:  cubit.popularMovies![0]);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorsManager.darkGrey,
                  image: DecorationImage(
                      image: NetworkImage(
                          "${cubit.baseImageUrl}${cubit.popularMovies![0].backgroundImagePath}"),
                      fit: BoxFit.fill),
                ),
                width: double.infinity,
                height: 217.h,
                child: const Center(
                  child: Icon(
                    Icons.play_circle,
                    color: ColorsManager.white,
                    size: 60,
                  ),
                ),
              ),
              Container(
                decoration:const  BoxDecoration(
                  color: ColorsManager.background,
                ),
                width: double.infinity,
                height: 70.h,
                child:  Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.popularMovies![0].title!,
                        style: AppStyles.mediumTitles,
                      ),
                      Text(
                        cubit.popularMovies![0].releaseDate!,
                        style: AppStyles.smallText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  color: ColorsManager.darkGrey,
                  width: 100,
                  height: 150,
                  child: ImageNetworkWidget(imagePath: cubit.popularMovies![0].posterImagePath),
                ),
                cubit.popularMovies![0].watchList?
                Container(
                  width: 27.w,
                  height: 36.h,
                  color: ColorsManager.yellow,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        cubit.addToWatchList(cubit.popularMovies![0]);
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
                        cubit.addToWatchList(cubit.popularMovies![0]);
                      },
                      icon: Icon(
                        Icons.add,
                        color: ColorsManager.white,
                      ),
                    ),
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
