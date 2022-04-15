import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tmdb/ui/widgets/big_text.dart';
import 'package:tmdb/ui/widgets/small_text.dart';

import '../../controllers/movie_controller.dart';
import '../../theme/theme.dart';
import '../../utils/assets_helper.dart';
import '../../utils/colors.dart';
import 'movie_list.dart';

class HomeScreen extends GetWidget<MovieController> {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _loadData() async {
    await Get.find<MovieController>().geMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.menu, color: Colors.black45),
          title: Text('Movies'.toUpperCase(), style: homeTitle),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 10.w),
              child: CircleAvatar(
                backgroundImage: AssetImage(assets['logo']),
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _loadData,
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                  top: 10.w,
                  start: 20.w,
                  end: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: 'Movies', color: AppColors.mainColor),
                        // SizedBox(height: 4.w),
                        Row(
                          children: [
                            SmallText(text: 'Popular', color: Colors.black54),
                            Icon(Icons.arrow_drop_down_rounded, size: 24.w)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 50.w,
                        height: 50.w,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const Expanded(
                child: SingleChildScrollView(
                  // child: FoodPageBody(),
                  child: MovieList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
