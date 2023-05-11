import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/repository/tv_repository.dart';
import 'package:movie_app/model/review_model.dart';

part 'get_tv_detail_state.dart';
part 'get_tv_detail_cubit.freezed.dart';

@injectable
class GetTvDetailCubit extends Cubit<GetTvDetailState> {
  final TvRepository repository;
  GetTvDetailCubit(this.repository) : super(const GetTvDetailState.loading());

  request(int id) async {
    emit(const GetTvDetailState.loading());
    // try {
    final result = await repository.getReview(id);
    emit(GetTvDetailState.loaded(result.results));
    // } catch (e) {
    //   emit(GetTvDetailState.error(e.toString()));
    // }
  }
}
