import 'dart:async';

import 'package:apinew_app/view/home/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "inital";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeView.routName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/splash.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
