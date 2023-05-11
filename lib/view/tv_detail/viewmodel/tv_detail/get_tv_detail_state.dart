part of 'get_tv_detail_cubit.dart';

@freezed
class GetTvDetailState with _$GetTvDetailState {
  const factory GetTvDetailState.loading() = _Loading;
  const factory GetTvDetailState.loaded(List<ReviewModel> reviews) = _Loaded;
  const factory GetTvDetailState.error(String message) = _Error;
}
