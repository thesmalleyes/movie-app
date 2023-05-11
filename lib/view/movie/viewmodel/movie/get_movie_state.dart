part of 'get_movie_cubit.dart';

@freezed
class GetMovieState with _$GetMovieState {
  const factory GetMovieState.loading() = _Loading;
  const factory GetMovieState.loaded(
    List<MovieModel> upcoming,
    List<MovieModel> nowPlaying,
    List<MovieModel> popular,
  ) = _Loaded;
  const factory GetMovieState.error(String message) = _Error;
}
