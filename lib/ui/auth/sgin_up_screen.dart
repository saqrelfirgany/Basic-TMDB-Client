import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tmdb/utils/assets_helper.dart';
import 'package:tmdb/utils/colors.dart';

import '../../controllers/login_controller.dart';
import '../../theme/theme.dart';
import '../components.dart';

class SignUpScreen extends GetWidget<LoginController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emCon = TextEditingController();
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Image.asset(
                  assets['logo'],
                  fit: BoxFit.cover,
                  height: 120.h,
                  width: 120.h,
                ),
              ),
              SizedBox(height: 24.h),
              GetBuilder<LoginController>(
                builder: (controller) => Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    reverse: controller.isReverse,
                    child: Column(
                      children: [
                        textFormContainer(
                          child: TextField(
                            controller: controller.userNameController,
                            // onTap: () => controller.toggleReverse(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsetsDirectional.all(24.w),
                              hintText: 'User Name',
                              hintStyle: TextStyle(fontSize: 20.sp),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: AppColors.yellowColor,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        textFormContainer(
                          child: TextField(
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsetsDirectional.all(24.w),
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 20.sp),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColors.yellowColor,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              suffixIcon: visibility(),
                            ),
                            obscureText: controller.isVisible,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        textFormContainer(
                          child: buttonStadiumBorder(
                            child: Center(
                              child: controller.isLoading
                                  ? pleaseWaitButtonState()
                                  : const Text('Sign In'),
                            ),
                            press: () {
                              FocusScope.of(context).unfocus();
                              controller.signInSimulator();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buttonStadiumBorder({
  required Widget child,
  required VoidCallback press,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(60.h),
      onPrimary: Colors.white,
      primary: primaryColor,
      textStyle: TextStyle(fontSize: 20.sp),
      shape: const StadiumBorder(),
    ),
    onPressed: press,
    child: child,
  );
}

Widget pleaseWaitButtonState() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40.w,
          height: 40.w,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10.w),
        Text('please-wait...'.tr),
      ],
    ),
  );
}
