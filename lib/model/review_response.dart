import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/model/review_model.dart';

part 'review_response.freezed.dart';
part 'review_response.g.dart';

@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    required List<ReviewModel> results,
    required int totalPages,
    required int totalResults,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
}
