class Movie {
  Dates? _dates;
  int? _page;
  int? _totalPages;
  int? _totalResults;
  late List<MovieModel> _movies;

  List<MovieModel> get movies => _movies;

  Movie({
    required dates,
    required page,
    required totalPages,
    required totalResults,
    required movies,
  }) {
    _dates = dates;
    _page = page;
    _totalPages = totalPages;
    _totalResults = totalResults;
    _movies = movies;
  }

  Movie.fromJson(Map<String, dynamic> json) {
    _dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    _page = json['page'];
    if (json['results'] != null) {
      _movies = <MovieModel>[];
      json['results'].forEach((e) {
        _movies.add(MovieModel.fromJson(e));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}

class MovieModel {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  dynamic voteAverage;
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieModel.fromJson(Map<dynamic, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
