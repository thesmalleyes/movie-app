import 'package:injectable/injectable.dart';
import 'package:movie_app/constant/app_endpoint.dart';

import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/data/source/api/api_source.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/review_response.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final ApiSource apiSource;

  MovieRepositoryImpl(
    this.apiSource,
  );

  @override
  Future<MovieResponse> getNowPlayingMovies() async {
    try {
      final response = await apiSource.request(
          RequestType.get, AppEndpoints.nowPlayingMovies);
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MovieResponse> getPopularMovies() async {
    try {
      final response =
          await apiSource.request(RequestType.get, AppEndpoints.popularMovies);
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MovieResponse> getUpcomingMovies() async {
    try {
      final response =
          await apiSource.request(RequestType.get, AppEndpoints.upcomingMovies);
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<ReviewResponse> getReview(int id) async {
    try {
      final response = await apiSource.request(
          RequestType.get, '${AppEndpoints.movie}$id/reviews');
      return ReviewResponse.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
