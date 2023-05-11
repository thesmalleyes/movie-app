import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/model/review_model.dart';

part 'get_detail_state.dart';
part 'get_detail_cubit.freezed.dart';

@injectable
class GetDetailCubit extends Cubit<GetDetailState> {
  final MovieRepository repository;
  GetDetailCubit(this.repository) : super(const GetDetailState.loading());

  requestMovie(int id) async {
    emit(const GetDetailState.loading());
    try {
      final result = await repository.getReview(id);
      emit(GetDetailState.loaded(result.results));
    } catch (e) {
      emit(GetDetailState.error(e.toString()));
    }
  }
}
