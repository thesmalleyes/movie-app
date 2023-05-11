part of 'get_detail_cubit.dart';

@freezed
class GetDetailState with _$GetDetailState {
  const factory GetDetailState.loading() = _Loading;
  const factory GetDetailState.loaded(List<ReviewModel> reviews) = _Loaded;
  const factory GetDetailState.error(String message) = _Error;
}
