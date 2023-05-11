import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/app_color.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/core/service/injector.dart';
import 'package:movie_app/view/movie_detail/viewmodel/detail/get_detail_cubit.dart';
import 'package:movie_app/view/splash/splash_screen.dart';
import 'package:movie_app/view/tv_detail/viewmodel/tv_detail/get_tv_detail_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Env.dev);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => di.get<GetDetailCubit>(),
      ),
      BlocProvider(
        create: (context) => di.get<GetTvDetailCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.appName,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: AppColor.primary),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColor.secondary,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
