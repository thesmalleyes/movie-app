import 'package:flutter/material.dart';

class CVerticalImage extends StatelessWidget {
  final String url;
  final double imageWidth;
  final double imageHeight;
  final String title;
  final Function() onTap;
  const CVerticalImage(
      {super.key,
      required this.url,
      required this.imageWidth,
      required this.title,
      required this.imageHeight,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 8.0),
        width: imageWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: imageHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  url,
                  fit: BoxFit.fitHeight,
                  height: imageHeight,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
