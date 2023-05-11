import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/app_color.dart';
import 'package:movie_app/model/tv_model.dart';
import 'package:movie_app/view/movie_detail/widget/detail_body_widget.dart';
import 'package:movie_app/view/movie_detail/widget/detail_header_widget.dart';
import 'package:movie_app/view/movie_detail/widget/review_widget.dart';
import 'package:movie_app/view/tv_detail/viewmodel/tv_detail/get_tv_detail_cubit.dart';

class TvDetailScreen extends StatefulWidget {
  final TvModel tv;
  const TvDetailScreen({super.key, required this.tv});

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  late TvModel tv;
  @override
  void initState() {
    tv = widget.tv;
    BlocProvider.of<GetTvDetailCubit>(context).request(tv.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<GetTvDetailCubit, GetTvDetailState>(
        builder: (context, state) => state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (reviews) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailHeaderWidget(size: size, imagePath: tv.posterPath),
                DetailBodyWidget(
                  overview: tv.overview,
                  title: tv.name,
                  releasedDate: tv.firstAirDate,
                ),
                ReviewWidget(reviews: reviews)
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
