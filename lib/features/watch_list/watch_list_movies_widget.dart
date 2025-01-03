import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/watch_list/watch_list_cubit.dart';

import '../../Data/Models/movie.dart';
import '../../core/app_styles.dart';
import '../../core/colors_manager.dart';
import '../../core/image_network_widget.dart';
import '../../core/routes_manager.dart';

class WatchListMoviesWidget extends StatelessWidget {
  WatchListMoviesWidget({required this.cubit,super.key});
  WatchListCubit cubit;
  List<Movie>? results=[];
  @override
  Widget build(BuildContext context) {
    results=cubit.watchListMovies;
    return ListView.separated(

        itemBuilder: (context, index) {

          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesManager.moviesDetails,arguments: results![index]);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 89.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ImageNetworkWidget(imagePath: results![index].posterImagePath),
                      ),
                      Container(
                        width: 27.w,
                        height: 36.h,
                        color: ColorsManager.yellow,
                        child: Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              cubit.removeFromWatchList(results![index],index);
                            },
                            icon: Icon(
                              Icons.done,
                              color: ColorsManager.white.withOpacity(.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${results![index].title}",
                            style: AppStyles.mediumTitles),
                        Text(
                          "${results![index].releaseDate}",
                          style: AppStyles.mediumTitles,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: results!.length);
  }
}
