import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tmdb/core/repository/login_reop.dart';
import 'package:tmdb/models/login_model.dart';
import 'package:tmdb/models/response_model.dart';
import 'package:tmdb/route/routes.dart';

import '../ui/components.dart';

class LoginController extends GetxController {
  final LoginRepo loginRepo;

  LoginController({required this.loginRepo});

  bool _isLoading = false;

  get isLoading => _isLoading;

  bool _isVisible = true;

  get isVisible => _isVisible;

  bool _isReverse = false;

  get isReverse => _isReverse;

  late String password, name;

  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // void signIn() async {
  //   validate();
  //   // _isLoading.value = true;
  //   // update();
  //   LoginRequestModel requestModel = LoginRequestModel(
  //     userName: "0201029584890",
  //     password: "admin@admin2021",
  //   );
  //   try {
  //     final response = await apiClient.postData(
  //       uri: AppConstants.loginUrl,
  //       body: requestModel.toJson(),
  //     );
  //     if (response == null || response == '') return;
  //     // print(response.body);
  //
  //     ///Just the token or a model
  //     final token = response.body['data']['access_token'];
  //     AppConstants.token = token;
  //     print(AppConstants.token);
  //     await storage.write(key: 'token', value: token);
  //     Get.offAllNamed('/home-screen');
  //   } finally {
  //     // _isLoading.value = false;
  //     // update();
  //   }
  // }

  void toggleReverse() {
    _isReverse = true;
    update();
  }

  void changeVisibility() {
    _isVisible = !_isVisible;
    update();
  }

  void signInSimulator() async {
    if (userNameController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your user name');
      return;
    }
    if (passwordController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your password');
      return;
    }
    _isLoading = true;
    update();

    final Response tokenResponse = await loginRepo.getServerToken();
    LoginModel loginModel = LoginModel(
      name: userNameController.text.trim(),
      password: passwordController.text.trim(),
      token: tokenResponse.body['request_token'],
    );
    final Response response =
        await loginRepo.getRegister(loginModel: loginModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      loginRepo.saveUserToken(token: response.body['request_token']);
      responseModel = ResponseModel(true, response.body['request_token']);
      Get.offAndToNamed(Routes.mainScreen);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
  }

  bool userLoggedIn() {
    return loginRepo.userLoggedIn();
  }
}
