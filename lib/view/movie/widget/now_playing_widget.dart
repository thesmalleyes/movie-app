import 'package:flutter/material.dart';
import 'package:movie_app/component/c_vertical_image.dart';
import 'package:movie_app/constant/app_endpoint.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/component/c_title.dart';
import 'package:movie_app/view/movie_detail/movie_detail_screen.dart';

class NowPlayingWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const NowPlayingWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    const imageHeight = 150.0;
    const imageWidth = 160 * 2 / 3;
    const infoHeight = 40;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        CTitle(title: AppText.nowPlayingMovies, onTap: () {}),
        SizedBox(
          height: imageHeight + infoHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return CVerticalImage(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                      movie: movies[index],
                    ),
                  ),
                ),
                url: '${AppEndpoints.imageUrl}${movies[index].posterPath}',
                imageWidth: imageWidth,
                title: movies[index].title,
                imageHeight: imageHeight,
              );
            },
          ),
        ),
      ],
    );
  }
}
