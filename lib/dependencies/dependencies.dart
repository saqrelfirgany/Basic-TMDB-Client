import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/controllers/auth_controller.dart';

import '../../controllers/movie_controller.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import '../repository/auth_reop.dart';
import '../repository/movie_repo.dart';

Future<void> init() async {
  ///
  /// SharedPreferences
  ///
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences, fenix: true);

  ///
  /// API Client
  ///
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  ///
  /// Repository
  ///
  Get.lazyPut(() => MovieRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(
    () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
    fenix: true,
  );

  ///
  /// Controller
  ///
  Get.lazyPut(() => MovieController(productRepo: Get.find()), fenix: true);
  Get.lazyPut(() => AuthController(loginRepo: Get.find()), fenix: true);
}
