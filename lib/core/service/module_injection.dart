import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ModuleInject {
  @LazySingleton()
  Dio dio() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/',
      validateStatus: (status) {
        return (status ?? 0) < 500;
      },
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMGYwODBjNDUxZTMyM2U1M2Y4ZGZhZGY0ZTNmMjQxYyIsInN1YiI6IjVjNWY5NjliMGUwYTI2MzgyMzZhYTJjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.seO5ykfjC5zz34R0y5BK9ziaVEM8VdVuMmAYHuxziBo'
      },
    );
    return dio;
  }
}
