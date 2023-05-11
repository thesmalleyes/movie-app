import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/app_color.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/view/movie_detail/viewmodel/detail/get_detail_cubit.dart';
import 'package:movie_app/view/movie_detail/widget/detail_body_widget.dart';
import 'package:movie_app/view/movie_detail/widget/detail_header_widget.dart';
import 'package:movie_app/view/movie_detail/widget/review_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieModel movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieModel movie;
  @override
  void initState() {
    movie = widget.movie;
    BlocProvider.of<GetDetailCubit>(context).requestMovie(movie.id);
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
      body: BlocBuilder<GetDetailCubit, GetDetailState>(
        builder: (context, state) => state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (reviews) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailHeaderWidget(size: size, imagePath: movie.posterPath),
                DetailBodyWidget(
                  overview: movie.overview,
                  title: movie.title,
                  releasedDate: movie.releaseDate,
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
