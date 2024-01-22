import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techcart/repository/models/reviews_model.dart';
import 'package:techcart/shared/gen/assets.gen.dart';

class ReviewsItem extends StatelessWidget {
  const ReviewsItem({super.key, required this.model});

  final ReviewsDataModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3.0.w),
                    borderRadius: BorderRadius.circular(
                      158.0.r,
                    )),
                child: CircleAvatar(
                    radius: 68.0.r,
                    backgroundImage: model.user!.photo != null
                        ? CachedNetworkImageProvider(model.user!.photo!)
                        : const $AssetsImagesGen()
                            .defaultProfileImage
                            .provider()),
              ),
              SizedBox(
                width: 37.0.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      model.user!.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0.w,
                  ),
                  RatingBar(
                      minRating: 1,
                      maxRating: 5,
                      initialRating: model.rating!.toDouble(),
                      ignoreGestures: true,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.only(
                        right: 1.5,
                        left: 1.5,
                      ),
                      ratingWidget: RatingWidget(
                        empty: const Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                        half: const Icon(
                          Icons.star_half,
                          color: Color.fromARGB(255, 235, 88, 78),
                        ),
                        full: const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 240, 105, 96),
                        ),
                      ),
                      onRatingUpdate: (value) {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
