import 'package:get/get.dart';
import 'package:tmdb/models/movie_model.dart';

import '../repository/movie_repo.dart';

class MovieController extends GetxController {
  final MovieRepo productRepo;

  MovieController({required this.productRepo});

  List<MovieModel> _movieList = [];

  List<MovieModel> get movieList => _movieList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> geMovieList() async {
    _isLoading = true;
    Response response = await productRepo.getMovie();

    ///
    /// Check if the response is null or not
    ///
    _isLoading = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      var movies = response.body['results'] as List;
      _movieList = movies.map((e) => MovieModel.fromJson(e)).toList();

      _movieList.addAll(Movie.fromJson(response.body).movies);
      print(_movieList.length);
      _isLoading = false;
      update();
    } else {}
    update();
  }
}
