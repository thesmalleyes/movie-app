import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/component/c_banner_image.dart';
import 'package:movie_app/constant/app_endpoint.dart';
import 'package:movie_app/model/tv_model.dart';
import 'package:movie_app/view/tv_detail/tv_detail_screen.dart';

class TvBannerWidget extends StatelessWidget {
  final List<TvModel> tvs;
  const TvBannerWidget({super.key, required this.tvs});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 5,
      width: size.width,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CBannerImage(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TvDetailScreen(
                  tv: tvs[index],
                ),
              ),
            ),
            imageUrl: '${AppEndpoints.imageUrl}${tvs[index].posterPath}',
            size: size,
          );
        },
        viewportFraction: .8,
        onTap: (index) {},
        autoplay: true,
        itemCount: tvs.length,
        pagination: const SwiperPagination(
          margin: EdgeInsets.all(0),
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey,
            size: 4,
            activeSize: 8,
          ),
        ),
      ),
    );
  }
}
