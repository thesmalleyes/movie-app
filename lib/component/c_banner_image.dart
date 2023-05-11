import 'package:flutter/material.dart';

class CBannerImage extends StatelessWidget {
  final String imageUrl;
  final Size size;
  final Function() onTap;
  const CBannerImage(
      {super.key,
      required this.imageUrl,
      required this.size,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            height: size.height * .2,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
