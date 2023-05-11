import 'package:flutter/material.dart';

class CHorizontalImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final String title;
  final Function() onTap;
  const CHorizontalImage(
      {super.key,
      required this.url,
      required this.height,
      required this.width,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 8.0),
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.network(
                url,
                fit: BoxFit.fitWidth,
                height: height,
                width: width,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: const [
                        0.4,
                        0.6,
                      ],
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.6),
                      ],
                    ),
                  ),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
