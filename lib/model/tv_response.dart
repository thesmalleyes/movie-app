import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/model/tv_model.dart';

part 'tv_response.freezed.dart';
part 'tv_response.g.dart';

@freezed
class TvResponse with _$TvResponse {
  const factory TvResponse({
    required int page,
    required List<TvModel> results,
    required int totalPages,
    required int totalResults,
  }) = _TvResponse;

  factory TvResponse.fromJson(Map<String, dynamic> json) =>
      _$TvResponseFromJson(json);
}
