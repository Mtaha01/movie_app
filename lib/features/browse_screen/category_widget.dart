import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryText;
  const CategoryWidget({required this.categoryText});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              categoryText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
