import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/service/injector.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(String env) => init(di, environment: env);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
