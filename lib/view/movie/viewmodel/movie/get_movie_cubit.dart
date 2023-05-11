import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/model/movie_model.dart';

part 'get_movie_state.dart';
part 'get_movie_cubit.freezed.dart';

@injectable
class GetMovieCubit extends Cubit<GetMovieState> {
  final MovieRepository repository;
  GetMovieCubit(this.repository) : super(const GetMovieState.loading());

  request() async {
    try {
      final rUpcoming = await repository.getUpcomingMovies();
      final rNowPlaying = await repository.getNowPlayingMovies();
      final rPopular = await repository.getPopularMovies();
      emit(GetMovieState.loaded(
          rUpcoming.results, rNowPlaying.results, rPopular.results));
    } catch (e) {
      emit(GetMovieState.error(e.toString()));
    }
  }
}
