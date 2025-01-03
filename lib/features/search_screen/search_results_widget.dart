import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/app_styles.dart';
import 'package:movies_app/core/image_network_widget.dart';
import 'package:movies_app/core/routes_manager.dart';


import '../../Data/Models/movie.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({required this.results, super.key});
  final List<Movie>? results;
  @override
  Widget build(BuildContext context) {
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
                  child: Container(
                    height: 89.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ImageNetworkWidget(imagePath: results![index].posterImagePath),
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
          return Divider();
        },
        itemCount: results!.length);
  }
}
