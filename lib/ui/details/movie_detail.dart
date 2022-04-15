import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tmdb/controllers/auth_controller.dart';

import '../../controllers/movie_controller.dart';
import '../../route/routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';
import '../widgets/expandable_text.dart';
import 'components.dart';

class MovieDetailScreen extends StatelessWidget {
  final int pageId;

  const MovieDetailScreen({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = Get.find<MovieController>().movieList[pageId];

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: movieDetailsBottomNavBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.offNamed(Routes.mainScreen),
                  child: AppIcon(icon: Icons.clear, iconSize: 16),
                ),
                InkWell(
                  onTap: () {},
                  child: AppIcon(icon: Icons.favorite, iconSize: 20),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20.r),
                    topEnd: Radius.circular(20.r),
                  ),
                ),
                child: Center(
                  child: BigText(text: movie.title!, size: 26),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(AppConstants.imageUri + movie.posterPath!),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(10.w),
                child: ExpandableText(text: movie.overview!),
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
