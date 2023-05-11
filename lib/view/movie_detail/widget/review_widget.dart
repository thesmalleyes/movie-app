import 'package:flutter/material.dart';
import 'package:movie_app/component/c_title.dart';
import 'package:movie_app/constant/app_color.dart';
import 'package:movie_app/constant/app_endpoint.dart';
import 'package:movie_app/constant/app_text.dart';

import 'package:movie_app/model/review_model.dart';

class ReviewWidget extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewWidget({
    Key? key,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: reviews.isEmpty
          ? Center(
              child: Text(
              AppText.reviewIsNotAvailable,
              style: const TextStyle(color: Colors.white),
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTitle(
                  title: AppText.reviews,
                  onTap: () {},
                  color: Colors.white,
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    final author = reviews[index].authorDetails;
                    final avatarPath = reviews[index].authorDetails.avatarPath;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: avatarPath != null
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(avatarPath
                                                .contains('http')
                                            ? avatarPath
                                            : '${AppEndpoints.imageUrl}$avatarPath'))
                                    : null),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      author.name,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      reviews[index].authorDetails.rating ==
                                              null
                                          ? '-'
                                          : reviews[index]
                                              .authorDetails
                                              .rating
                                              .toString(),
                                      style:
                                          TextStyle(color: AppColor.secondary),
                                    )
                                  ],
                                ),
                                Text(
                                  reviews[index].content,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
