import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/review_response.dart';

abstract class MovieRepository {
  Future<MovieResponse> getUpcomingMovies();
  Future<MovieResponse> getNowPlayingMovies();
  Future<MovieResponse> getPopularMovies();
  Future<ReviewResponse> getReview(int id);
}
