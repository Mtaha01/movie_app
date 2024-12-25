import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/features/home/home_cubit.dart';

import '../../Data/web_services/movies_services.dart';

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
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: 200,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.blue,
                        width: 100,
                        height: 150,
                      ),
                      Text("Movie Name"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 160,
                color: ColorsManager.darkGrey,
                child: cubit.newMoviesIsLoading
                    ? Icon(Icons.downloading)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              "New Releases",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.newReleasedMovies!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 100,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          "${cubit.baseImageUrl}${cubit.newReleasedMovies![index].posterImagePath}",
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ]),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 160,
                color: ColorsManager.darkGrey,
                child: cubit.recommendedMoviesIsLoading
                    ? Icon(Icons.downloading)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              "Recommended",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.recommendedMovies!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 100,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          "${cubit.baseImageUrl}${cubit.recommendedMovies![index].posterImagePath}",
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
