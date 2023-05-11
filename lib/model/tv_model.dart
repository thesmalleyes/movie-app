import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_model.freezed.dart';
part 'tv_model.g.dart';

@freezed
class TvModel with _$TvModel {
  const factory TvModel({
    String? backdropPath,
    required DateTime firstAirDate,
    required List<int> genreIds,
    required int id,
    required String name,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required double popularity,
    required String posterPath,
    required double voteAverage,
    required int voteCount,
  }) = _TvModel;

  factory TvModel.fromJson(Map<String, dynamic> json) =>
      _$TvModelFromJson(json);
}
