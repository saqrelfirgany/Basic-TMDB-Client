import 'package:get/get.dart';

import '../../ui/components.dart';
import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late Map<String, String> _query;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.token;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    _query = {'api_key': AppConstants.apiKey};
  }

  Future<dynamic> getData(String uri) async {
    try {
      final response = await get(uri, query: _query);

      ///
      /// Check if the response is null or not
      ///
      if (response.body == null || response.hasError) {
        getSnackBar(
          title: 'Error',
          body: 'Please check your internet connection',
        );
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
