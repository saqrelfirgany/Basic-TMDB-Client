import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/movie_controller.dart';
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
      builder: (recommendedController) => recommendedController.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedController.movieList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.toNamed('/recommended-popular-detail?pageId=$index'),
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
                                AppConstants.uploadUri +
                                    recommendedController
                                        .movieList[index].img!,
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
                                  text: recommendedController
                                      .movieList[index].name!,
                                ),
                                SizedBox(height: 8.h),
                                SmallText(
                                  text: recommendedController
                                      .movieList[index].description!,
                                  overFlow: true,
                                ),
                                const Spacer(),
                                buildSubHeaderDetailsRowIcons(),
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
Widget buildSubHeaderDetailsRowIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      IconText(
        icon: Icons.circle_sharp,
        text: 'Normal',
        iconColor: AppColors.iconColor1,
      ),
      IconText(
        icon: Icons.location_on,
        text: '1.7Km',
        iconColor: AppColors.mainColor,
      ),
      IconText(
        icon: Icons.access_time_rounded,
        text: '32min',
        iconColor: AppColors.iconColor2,
      ),
    ],
  );
}
Widget recommendedTitle() {
  ///
  ///The Recommended Food list home screen section 2
  ///
  return Container(
    margin: EdgeInsetsDirectional.only(start: 30.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BigText(text: 'Recommended'),
        SizedBox(width: 10.w),
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 3.h),
          child: BigText(
            text: '.',
            color: Colors.black26,
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 2.h),
          child: SmallText(text: 'Food Pairing'),
        ),
      ],
    ),
  );
}
