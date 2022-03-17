import 'package:get/get.dart';
import 'package:tmdb/models/movie_model.dart';

import '../core/repository/movie_repo.dart';

class MovieController extends GetxController {
  final MovieRepo productRepo;

  MovieController({required this.productRepo});

  List<dynamic> _movieList = [];

  List<dynamic> get movieList => _movieList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> geMovieList() async {
    _isLoading = true;
    Response response = await productRepo.getMovie();

    ///
    /// Check if the response is null or not
    ///
    _isLoading = false;
    if (response.statusCode == 200) {
      _movieList = [];
      _movieList.addAll(Movie.fromJson(response.body).movies);
      print(_movieList.length);
      _isLoading = false;
      update();
    } else {}
    update();
  }
}
