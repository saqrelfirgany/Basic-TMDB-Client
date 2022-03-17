import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/login_controller.dart';
import '../../utils/colors.dart';
import '../widgets/big_text.dart';

Widget movieDetailsBottomNavBar() {
  return GetBuilder<LoginController>(
    builder: (controller) => Container(
      height: 120.h,
      padding: EdgeInsetsDirectional.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(35.r),
          topEnd: Radius.circular(35.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70.w,
            width: 70.w,
            margin: EdgeInsetsDirectional.only(
              start: 10.w,
              bottom: 10.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(14.r),
            ),
            child: Icon(
              Icons.favorite,
              color: AppColors.mainColor,
              size: 45.w,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 55.h,
              width: 240.w,
              margin: EdgeInsetsDirectional.only(
                start: 10.w,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(18.r),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: 'Add to Watch List',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
