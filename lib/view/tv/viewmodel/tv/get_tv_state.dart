part of 'get_tv_cubit.dart';

@freezed
class GetTvState with _$GetTvState {
  const factory GetTvState.loading() = _Loading;
  const factory GetTvState.loaded(
    List<TvModel> airing,
    List<TvModel> onTheAir,
    List<TvModel> popular,
  ) = _Loaded;
  const factory GetTvState.error(String message) = _Error;
}
