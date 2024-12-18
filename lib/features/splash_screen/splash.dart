import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context,RoutesManager.home),
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
