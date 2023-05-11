import 'package:injectable/injectable.dart';
import 'package:movie_app/constant/app_endpoint.dart';

import 'package:movie_app/data/repository/tv_repository.dart';
import 'package:movie_app/data/source/api/api_source.dart';
import 'package:movie_app/model/review_response.dart';
import 'package:movie_app/model/tv_response.dart';

@Injectable(as: TvRepository)
class MovieRepositoryImpl implements TvRepository {
  final ApiSource apiSource;

  MovieRepositoryImpl(
    this.apiSource,
  );

  @override
  Future<TvResponse> getAiringTodayTv() async {
    try {
      final response =
          await apiSource.request(RequestType.get, AppEndpoints.airingTvs);
      return TvResponse.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<TvResponse> getOnTheAirTv() async {
    try {
      final response =
          await apiSource.request(RequestType.get, AppEndpoints.onTheAirTvs);
      return TvResponse.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<TvResponse> getPopularTv() async {
    try {
      final response =
          await apiSource.request(RequestType.get, AppEndpoints.popularTvs);
      return TvResponse.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<ReviewResponse> getReview(int id) async {
    // try {
    final response = await apiSource.request(
        RequestType.get, '${AppEndpoints.tv}$id/reviews');
    return ReviewResponse.fromJson(response.data);
    // } catch (e) {
    //   throw e.toString();
    // }
  }
}
