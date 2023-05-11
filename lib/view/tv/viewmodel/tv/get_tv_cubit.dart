import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/repository/tv_repository.dart';
import 'package:movie_app/model/tv_model.dart';

part 'get_tv_state.dart';
part 'get_tv_cubit.freezed.dart';

@injectable
class GetTvCubit extends Cubit<GetTvState> {
  final TvRepository repository;
  GetTvCubit(this.repository) : super(const GetTvState.loading());

  request() async {
    // try {
    final rAiring = await repository.getAiringTodayTv();
    final rOnTheAir = await repository.getOnTheAirTv();
    final rPopular = await repository.getPopularTv();
    emit(GetTvState.loaded(
        rAiring.results, rOnTheAir.results, rPopular.results));
    // } catch (e) {
    //   emit(GetTvState.error(e.toString()));
    // }
  }
}
