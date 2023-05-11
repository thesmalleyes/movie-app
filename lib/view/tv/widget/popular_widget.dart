import 'package:flutter/material.dart';
import 'package:movie_app/component/c_horizontal_image.dart';
import 'package:movie_app/constant/app_endpoint.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/component/c_title.dart';
import 'package:movie_app/model/tv_model.dart';
import 'package:movie_app/view/tv_detail/tv_detail_screen.dart';

class PopularWidget extends StatelessWidget {
  final List<TvModel> tvs;
  const PopularWidget({super.key, required this.tvs});

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
        CTitle(title: AppText.popularTv, onTap: () {}),
        SizedBox(
          height: imageHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tvs.length,
            itemBuilder: (BuildContext context, int index) {
              return CHorizontalImage(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TvDetailScreen(
                      tv: tvs[index],
                    ),
                  ),
                ),
                url: '${AppEndpoints.imageUrl}${tvs[index].posterPath}',
                height: imageHeight,
                width: imageWidth,
                title: tvs[index].name,
              );
            },
          ),
        ),
      ],
    );
  }
}
