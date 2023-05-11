import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/model/movie_model.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    required List<MovieModel> results,
    required int totalPages,
    required int totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
