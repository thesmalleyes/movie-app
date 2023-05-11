import 'package:flutter/material.dart';
import 'package:movie_app/constant/app_endpoint.dart';
import 'package:movie_app/constant/app_text.dart';

class DetailHeaderWidget extends StatelessWidget {
  final String imagePath;
  final Size size;
  const DetailHeaderWidget(
      {super.key, required this.size, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: size.width / 2.5,
          width: size.width,
          child: Image.network(
            '${AppEndpoints.imageUrl}$imagePath',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black.withOpacity(.4)),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            Text(
              AppText.playTrailer,
              style: const TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
