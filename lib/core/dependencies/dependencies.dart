import 'package:get/get.dart';

import '../../controllers/movie_controller.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';
import '../repository/product_repo.dart';

Future<void> init() async {
  ///
  /// API Client
  ///
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  ///
  /// Repository
  ///
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));

  ///
  /// Controller
  ///
  Get.lazyPut(() => MovieController(productRepo: Get.find()));
}
