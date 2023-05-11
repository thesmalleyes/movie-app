import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/app_color.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/core/service/injector.dart';
import 'package:movie_app/view/homepage/viewmodel/index/index_cubit.dart';
import 'package:movie_app/view/movie/movie_screen.dart';
import 'package:movie_app/view/movie/viewmodel/movie/get_movie_cubit.dart';
import 'package:movie_app/view/profile/profile_screen.dart';
import 'package:movie_app/view/tv/tv_screen.dart';
import 'package:movie_app/view/tv/viewmodel/tv/get_tv_cubit.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  late IndexCubit _indexCubit;

  final List<Widget> screens = [
    BlocProvider(
      create: (context) => di.get<GetMovieCubit>(),
      child: const MovieScreen(),
    ),
    BlocProvider(
      create: (context) => di.get<GetTvCubit>(),
      child: const TvScreen(),
    ),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    _indexCubit = BlocProvider.of<IndexCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state,
            onTap: _indexCubit.setIndex,
            selectedItemColor: AppColor.primary,
            // unselectedItemColor: AppColors.gray,
            selectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 13),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.movie),
                label: AppText.movies,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.tv),
                label: AppText.tvSeries,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: AppText.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
