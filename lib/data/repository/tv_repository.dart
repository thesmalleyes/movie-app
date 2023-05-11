import 'package:movie_app/model/review_response.dart';
import 'package:movie_app/model/tv_response.dart';

abstract class TvRepository {
  Future<TvResponse> getAiringTodayTv();
  Future<TvResponse> getOnTheAirTv();
  Future<TvResponse> getPopularTv();
  Future<ReviewResponse> getReview(int id);
}
