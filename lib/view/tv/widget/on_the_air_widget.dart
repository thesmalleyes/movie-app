import 'package:flutter/material.dart';
import 'package:movie_app/component/c_vertical_image.dart';
import 'package:movie_app/constant/app_endpoint.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/component/c_title.dart';
import 'package:movie_app/model/tv_model.dart';
import 'package:movie_app/view/tv_detail/tv_detail_screen.dart';

class OnTheAirWidget extends StatelessWidget {
  final List<TvModel> tvs;
  const OnTheAirWidget({super.key, required this.tvs});

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
        CTitle(title: AppText.onTheAirTv, onTap: () {}),
        SizedBox(
          height: imageHeight + infoHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tvs.length,
            itemBuilder: (BuildContext context, int index) {
              return CVerticalImage(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TvDetailScreen(
                      tv: tvs[index],
                    ),
                  ),
                ),
                url: '${AppEndpoints.imageUrl}${tvs[index].posterPath}',
                imageWidth: imageWidth,
                title: tvs[index].name,
                imageHeight: imageHeight,
              );
            },
          ),
        ),
      ],
    );
  }
}
