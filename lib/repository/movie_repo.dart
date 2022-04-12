import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class MovieRepo extends GetxService {
  final ApiClient apiClient;

  MovieRepo({required this.apiClient});

  Future<Response> getMovie() async {
    return await apiClient.getData(uri: AppConstants.movieUri);
  }

}
