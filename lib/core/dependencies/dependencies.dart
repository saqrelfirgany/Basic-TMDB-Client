import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

Future<void> init() async {
  ///
  /// API Client
  ///
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  ///
  /// Repository
  ///
  // Get.lazyPut(() => ProductRepo(apiClient: Get.find()));

  ///
  /// Controller
  ///
  // Get.lazyPut(() => ProductController(recommendedRepo: Get.find()));
}
