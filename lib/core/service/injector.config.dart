// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/implementation/movie_repository_impl.dart' as _i7;
import '../../data/implementation/tv_repository_impl.dart' as _i9;
import '../../data/repository/movie_repository.dart' as _i6;
import '../../data/repository/tv_repository.dart' as _i8;
import '../../data/source/api/api_source.dart' as _i5;
import '../../view/homepage/viewmodel/index/index_cubit.dart' as _i4;
import '../../view/movie/viewmodel/movie/get_movie_cubit.dart' as _i11;
import '../../view/movie_detail/viewmodel/detail/get_detail_cubit.dart' as _i10;
import '../../view/tv/viewmodel/tv/get_tv_cubit.dart' as _i12;
import '../../view/tv_detail/viewmodel/tv_detail/get_tv_detail_cubit.dart'
    as _i13;
import 'module_injection.dart' as _i14;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final moduleInject = _$ModuleInject();
  gh.lazySingleton<_i3.Dio>(() => moduleInject.dio());
  gh.factory<_i4.IndexCubit>(() => _i4.IndexCubit());
  gh.lazySingleton<_i5.ApiSource>(() => _i5.ApiSource(gh<_i3.Dio>()));
  gh.factory<_i6.MovieRepository>(
      () => _i7.MovieRepositoryImpl(gh<_i5.ApiSource>()));
  gh.factory<_i8.TvRepository>(
      () => _i9.MovieRepositoryImpl(gh<_i5.ApiSource>()));
  gh.factory<_i10.GetDetailCubit>(
      () => _i10.GetDetailCubit(gh<_i6.MovieRepository>()));
  gh.factory<_i11.GetMovieCubit>(
      () => _i11.GetMovieCubit(gh<_i6.MovieRepository>()));
  gh.factory<_i12.GetTvCubit>(() => _i12.GetTvCubit(gh<_i8.TvRepository>()));
  gh.factory<_i13.GetTvDetailCubit>(
      () => _i13.GetTvDetailCubit(gh<_i8.TvRepository>()));
  return getIt;
}

class _$ModuleInject extends _i14.ModuleInject {}
