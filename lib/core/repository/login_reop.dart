import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/models/login_model.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class LoginRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LoginRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getRegister({required LoginModel loginModel}) async {
    return await apiClient.postData(
      uri: AppConstants.registerUri,
      body: loginModel.toJson(),
    );
  }

  Future<bool> saveUserToken({required String token}) async {
    apiClient.token = token;
    apiClient.updateHeader(token: token);
    return await sharedPreferences.setString('token', token);
  }
}
