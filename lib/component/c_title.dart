import 'package:flutter/material.dart';
import 'package:movie_app/constant/app_color.dart';
import 'package:movie_app/constant/app_text.dart';

class CTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final Function() onTap;
  const CTitle(
      {super.key, required this.title, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: color),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              AppText.seeAll,
              style: TextStyle(color: color ?? AppColor.primary),
            ),
          )
        ],
      ),
    );
  }
}
