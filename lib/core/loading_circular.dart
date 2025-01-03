import 'package:flutter/material.dart';

import 'colors_manager.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: const BoxDecoration(
          color: ColorsManager.darkGrey,
        ),
        child: const Center(child: CircularProgressIndicator(color: ColorsManager.lightGrey,)),
      ),
    );
  }
}
