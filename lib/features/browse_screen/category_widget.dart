import 'package:flutter/material.dart';
import 'package:movies_app/Data/Models/categories.dart';
import 'package:movies_app/core/routes_manager.dart';

class CategoryWidget extends StatelessWidget {
  final Categories category;
  const CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.filtered,arguments: category);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(image: AssetImage("assets/category.jpg"),fit: BoxFit.fill),
            ),
            width: 180,
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5), // Dark overlay
            ),
            height:100 ,
            width: 160,
            child: Center(
              child: Text(
                category.name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
