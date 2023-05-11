import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/movie/widget/movie_banner_widget.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/view/movie/viewmodel/movie/get_movie_cubit.dart';
import 'package:movie_app/view/movie/widget/now_playing_widget.dart';
import 'package:movie_app/view/movie/widget/popular_widget.dart';
import 'package:movie_app/component/c_title.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    BlocProvider.of<GetMovieCubit>(context).request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText.welcomeToMovie),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<GetMovieCubit, GetMovieState>(
        builder: (context, state) => state.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (upcoming, nowPlaying, popular) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTitle(
                  title: AppText.upcomingMovies,
                  onTap: () {},
                ),
                MovieBannerWidget(movies: upcoming),
                NowPlayingWidget(
                  movies: nowPlaying,
                ),
                PopularWidget(
                  movies: popular,
                )
              ],
            ),
          ),
          error: (message) => Center(
            child: Text(message),
          ),
        ),
      ),
    );
  }
}
