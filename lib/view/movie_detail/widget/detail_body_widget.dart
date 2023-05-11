import 'package:flutter/material.dart';
import 'package:movie_app/constant/app_color.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/util/time_converter.dart';

class DetailBodyWidget extends StatelessWidget {
  final String title;
  final String overview;
  final DateTime releasedDate;
  const DetailBodyWidget(
      {super.key,
      required this.title,
      required this.releasedDate,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            '${AppText.releasedOn} ${TimeConverter.readableDate(releasedDate)}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              const Icon(
                Icons.download,
                color: Colors.white,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      AppText.playNow,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            AppText.overview,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            overview,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
