import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/component/c_title.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/view/tv/viewmodel/tv/get_tv_cubit.dart';
import 'package:movie_app/view/tv/widget/on_the_air_widget.dart';
import 'package:movie_app/view/tv/widget/popular_widget.dart';
import 'package:movie_app/view/tv/widget/tv_banner_widget.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({super.key});

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  void initState() {
    BlocProvider.of<GetTvCubit>(context).request();
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
      body: BlocBuilder<GetTvCubit, GetTvState>(
        builder: (context, state) => state.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (airing, onTheAir, popular) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTitle(
                  title: AppText.airingTv,
                  onTap: () {},
                ),
                TvBannerWidget(tvs: airing),
                OnTheAirWidget(
                  tvs: onTheAir,
                ),
                PopularWidget(
                  tvs: popular,
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
