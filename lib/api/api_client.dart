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

  void updateHeader({required String token}) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> getData({required String uri}) async {
    try {
      final response = await get(uri, query: _query);

      ///
      /// Check if the response is null or not
      ///
      if (response.body == null) {
        getSnackBar(
          title: 'Error',
          body: 'Please check your internet connection',
        );
      }
      return response;
    } catch (error, stacktrace) {
      throw Exception('Exception accrued: $error with stacktrace: $stacktrace');
    }
  }

  Future<dynamic> postData({required String uri, required dynamic body}) async {
    try {
      Response response =
          await post(uri, body, headers: _mainHeaders, query: _query);

      ///
      /// Check if the response is null or not
      ///
      if (response.body == null) {
        getSnackBar(
          title: 'Error',
          body: 'Please check your internet connection',
        );
      }
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
