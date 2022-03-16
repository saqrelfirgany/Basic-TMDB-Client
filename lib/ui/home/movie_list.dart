import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/movie_controller.dart';
import '../../route/routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_with_text.dart';
import '../widgets/small_text.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      builder: (movieController) => movieController.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: movieController.movieList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.toNamed('${Routes.detailScreen}?pageId=$index'),
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w,
                      bottom: 10.h,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 120.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                AppConstants.imageUri +
                                    movieController
                                        .movieList[index].posterPath!,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            height: 100.h,
                            padding: EdgeInsetsDirectional.only(
                              start: 10.w,
                              top: 10.h,
                              end: 20.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(20.r),
                                bottomEnd: Radius.circular(20.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  text: movieController.movieList[index].title!,
                                ),
                                SizedBox(height: 8.h),
                                SmallText(
                                  text: movieController
                                      .movieList[index].overview!,
                                  overFlow: true,
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconText(
                                      icon: Icons.favorite,
                                      text: movieController
                                          .movieList[index].voteAverage
                                          .toString(),
                                      iconColor: AppColors.iconColor1,
                                    ),
                                    IconText(
                                      icon: Icons.visibility,
                                      text: movieController
                                          .movieList[index].popularity
                                          .toInt()
                                          .toString(),
                                      iconColor: AppColors.mainColor,
                                    ),
                                    const IconText(
                                      icon: Icons.access_time_rounded,
                                      text: '32min',
                                      iconColor: AppColors.iconColor2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
