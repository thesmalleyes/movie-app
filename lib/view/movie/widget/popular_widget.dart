import 'package:flutter/material.dart';
import 'package:movie_app/component/c_horizontal_image.dart';
import 'package:movie_app/constant/app_endpoint.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/component/c_title.dart';
import 'package:movie_app/view/movie_detail/movie_detail_screen.dart';

class PopularWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const PopularWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const imageHeight = 120.0;
    final imageWidth = size.width * 4 / 7;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        CTitle(title: AppText.popularMovies, onTap: () {}),
        SizedBox(
          height: imageHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return CHorizontalImage(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                      movie: movies[index],
                    ),
                  ),
                ),
                url: '${AppEndpoints.imageUrl}${movies[index].posterPath}',
                height: imageHeight,
                width: imageWidth,
                title: movies[index].title,
              );
            },
          ),
        ),
      ],
    );
  }
}
