import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../theme/theme.dart';
import '../utils/colors.dart';

void getSnackBar({required String title, required String body}) {
  Get.snackbar(
    title,
    body,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
  );
}

Widget textFormContainer({required Widget child}) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      start: 20.w,
      end: 20.w,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.r),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 7,
          offset: Offset(1, 10),
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    ),
    child: child,
  );
}

Widget visibility() {
  return GetBuilder<AuthController>(
    builder: (controller) => controller.isVisible
        ? iconVisible(
            press: () => controller.changeVisibility(),
            icon: Icons.visibility_off,
          )
        : iconVisible(
            press: () => controller.changeVisibility(),
            icon: Icons.visibility,
          ),
  );
}

Widget iconVisible({
  required VoidCallback press,
  required IconData icon,
}) {
  return InkWell(
    onTap: press,
    child: Icon(icon, color: AppColors.yellowColor),
  );
}
