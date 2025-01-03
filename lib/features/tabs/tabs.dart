import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/tabs/tabs_cubit.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>TabsCubit(),
        child: BlocConsumer<TabsCubit,TabsState>(
            builder: (BuildContext context,state){
              var cubit = context.read<TabsCubit>();
              return Scaffold(
                resizeToAvoidBottomInset: false,
                bottomNavigationBar: BottomNavigationBar(
                  //backgroundColor: ColorsManager.navigationColor,
                  currentIndex: cubit.selectedItem,
                  items:const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "Search",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.movie),
                      label: "Browse",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: "Wish List",
                    ),
                  ],
                  onTap: (index){
                      cubit.tabClicked(index);
                  },
                ),
                body: cubit.tabs[cubit.selectedItem],
              );
            },
            listener: (BuildContext context,state){
            }) ,
    );
  }
}
