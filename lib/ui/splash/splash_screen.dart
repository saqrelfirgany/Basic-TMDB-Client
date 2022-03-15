import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmdb/controllers/movie_controller.dart';
import 'package:tmdb/route/routes.dart';

import '../../utils/assets_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  void _loadData() async {
    await Get.find<MovieController>().geProductList();
  }

  void _animationState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    _animationState();
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(Routes.mainScreen),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ScaleTransition(
          scale: _animation,
          child: Center(
            child: Image.asset(
              assets['logo'],
              fit: BoxFit.cover,
              height: 120.h,
              width: 120.h,
            ),
          ),
        ),
      ),
    );
  }
}
