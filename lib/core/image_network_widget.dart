import 'package:flutter/material.dart';
import 'package:movies_app/core/loading_circular.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({required this.imagePath,super.key});
  final String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$baseImageUrl$imagePath",
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        if(imagePath==null){
          return  Container(
            color: Colors.grey[800], // Placeholder background
            child: const Icon(
              Icons.error, // Display an error icon
              color: Colors.red,
              //size: 40,
            ),
          );
        }
        return const Center(
          child: LoadingCircular(), // Show a spinner while loading
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[800], // Placeholder background
          child: const Icon(
            Icons.error, // Display an error icon
            color: Colors.red,
            //size: 40,
          ),
        );
      },
    );
  }
}
